# -*- encoding: utf-8 -*-
unless RUBY_PLATFORM =~ /java/
  puts 'This library is only compatible with a java-based ruby environment like JRuby.'
  exit 255
end

require 'ansj_seg_jars'
require 'multi_json'

module AnsjSeg
  def self.fitler
    @fitler ||= Filter.new
  end

  class Filter < Java::OrgAnsjRecognitionImpl::FilterRecognition
    def ignore(opts = { natures: ['null', 'w'], words: ['是', '的'] })
      if opts[:natures].is_a?(Array) && !opts[:natures].empty?
        self.insertStopNatures(*opts.delete(:natures))
      end

      if opts[:words].is_a?(Array) && !opts[:words].empty?
        self.insertStopWords(opts.delete(:words))
      end

      if opts[:regex].is_a?(Array) && !opts[:regex].empty?
        opts.delete(:regex).map { |r|  self.insertStopRegex(r) }
      end
    end

    def ignore!(opts = {})
      self.ignore(opts)
      self
    end
  end

  class Config < Java::OrgAnsjUtil::MyStaticValue
  end

  module JSON
    extend MultiJson
    
    def self.trans(obj)
      json = self.dump(obj).to_s
      self.load(json, use_bigdecimal: false, symbolize_keys: true)
    end
  end

  module String
    include_package 'org.ansj.splitWord.analysis'

    def to_a(pattern = nil, limit = 0)
      case pattern.to_s
      when /terms/
        split_terms(limit)
      when /words/
        split_words(limit)
      else
        split(pattern, limit) 
      end
    end
    alias_method :拆, :to_a

    private

      def split_terms(mode = nil)
        klass = case mode.to_s
        when /to/
          ToAnalysis
        when /nlp/
          NlpAnalysis
        when /index/
          IndexAnalysis
        else
          BaseAnalysis
        end

        JSON.trans klass.parse(self).recognition(AnsjSeg.fitler.ignore!).getTerms
      end

      def split_words(limit = 0)
        limit = if limit.to_i == 0
          20
        else
          limit
        end

        JSON.trans Java::OrgAnsjAppKeyword.KeyWordComputer.new(limit).computeArticleTfidf(self)
      end
  end

end # AnsjSeg

String.send(:include, AnsjSeg::String)