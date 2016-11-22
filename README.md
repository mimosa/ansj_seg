# AnsjSeg for jRuby

Read AnsjSeg docs for more details: https://github.com/NLPchina/ansj_seg

## Installing

Add to your `Gemfile`:

```ruby
gem 'ansj_seg'
```

Then `bundle install`.

Or install it yourself as:

    $ gem install ansj_seg

## Usage

```ruby
  require 'ansj_seg'

  # 设置用户词典
  AnsjSeg::Config::DIC['dic'] = '/Users/howl/Desktop/library/default.dic'
  AnsjSeg::Config::DIC['dic_souhu'] = '/Users/howl/Desktop/library/souhu.dic'
  AnsjSeg::Config::CRF['crf'] = '/Users/howl/Desktop/library/crf.model'
  AnsjSeg::Config.ambiguityLibrary = '/Users/howl/Desktop/library/ambiguity.dic'

  "Ruby China，对！没错！这里就是 Ruby 社区，目前这里已经是国内最权威的 Ruby 社区，拥有国内所有资深的 Ruby 工程师。".拆(:terms)
  => [{:name=>"ruby", :natureStr=>"en", :newWord=>false, :offe=>0, :realName=>"ruby"},
 {:name=>" ", :natureStr=>"null", :newWord=>false, :offe=>4, :realName=>" "},
 {:name=>"china", :natureStr=>"en", :newWord=>false, :offe=>5, :realName=>"china"},
 {:name=>"，", :natureStr=>"w", :newWord=>false, :offe=>10, :realName=>"，"},
 {:name=>"对", :natureStr=>"p", :newWord=>false, :offe=>11, :realName=>"对"},
 {:name=>"！", :natureStr=>"w", :newWord=>false, :offe=>12, :realName=>"！"},
 {:name=>"没错", :natureStr=>"v", :newWord=>false, :offe=>13, :realName=>"没错"},
 {:name=>"！", :natureStr=>"w", :newWord=>false, :offe=>15, :realName=>"！"},
 {:name=>"这里", :natureStr=>"r", :newWord=>false, :offe=>16, :realName=>"这里"},
 {:name=>"就", :natureStr=>"d", :newWord=>false, :offe=>18, :realName=>"就"},
 {:name=>"是", :natureStr=>"v", :newWord=>false, :offe=>19, :realName=>"是"},
 {:name=>" ", :natureStr=>"null", :newWord=>false, :offe=>20, :realName=>" "},
 {:name=>"ruby", :natureStr=>"en", :newWord=>false, :offe=>21, :realName=>"ruby"},
 {:name=>" ", :natureStr=>"null", :newWord=>false, :offe=>25, :realName=>" "},
 {:name=>"社区", :natureStr=>"n", :newWord=>false, :offe=>26, :realName=>"社区"},
 {:name=>"，", :natureStr=>"w", :newWord=>false, :offe=>28, :realName=>"，"},
 {:name=>"目前", :natureStr=>"t", :newWord=>false, :offe=>29, :realName=>"目前"},
 {:name=>"这", :natureStr=>"r", :newWord=>false, :offe=>31, :realName=>"这"},
 {:name=>"里", :natureStr=>"f", :newWord=>false, :offe=>32, :realName=>"里"},
 {:name=>"已经", :natureStr=>"d", :newWord=>false, :offe=>33, :realName=>"已经"},
 {:name=>"是", :natureStr=>"v", :newWord=>false, :offe=>35, :realName=>"是"},
 {:name=>"国内", :natureStr=>"s", :newWord=>false, :offe=>36, :realName=>"国内"},
 {:name=>"最", :natureStr=>"d", :newWord=>false, :offe=>38, :realName=>"最"},
 {:name=>"权威", :natureStr=>"n", :newWord=>false, :offe=>39, :realName=>"权威"},
 {:name=>"的", :natureStr=>"uj", :newWord=>false, :offe=>41, :realName=>"的"},
 {:name=>" ", :natureStr=>"null", :newWord=>false, :offe=>42, :realName=>" "},
 {:name=>"ruby", :natureStr=>"en", :newWord=>false, :offe=>43, :realName=>"ruby"},
 {:name=>" ", :natureStr=>"null", :newWord=>false, :offe=>47, :realName=>" "},
 {:name=>"社区", :natureStr=>"n", :newWord=>false, :offe=>48, :realName=>"社区"},
 {:name=>"，", :natureStr=>"w", :newWord=>false, :offe=>50, :realName=>"，"},
 {:name=>"拥有", :natureStr=>"v", :newWord=>false, :offe=>51, :realName=>"拥有"},
 {:name=>"国内", :natureStr=>"s", :newWord=>false, :offe=>53, :realName=>"国内"},
 {:name=>"所有", :natureStr=>"b", :newWord=>false, :offe=>55, :realName=>"所有"},
 {:name=>"资深", :natureStr=>"b", :newWord=>false, :offe=>57, :realName=>"资深"},
 {:name=>"的", :natureStr=>"uj", :newWord=>false, :offe=>59, :realName=>"的"},
 {:name=>" ", :natureStr=>"null", :newWord=>false, :offe=>60, :realName=>" "},
 {:name=>"ruby", :natureStr=>"en", :newWord=>false, :offe=>61, :realName=>"ruby"},
 {:name=>" ", :natureStr=>"null", :newWord=>false, :offe=>65, :realName=>" "},
 {:name=>"工程师", :natureStr=>"n", :newWord=>false, :offe=>66, :realName=>"工程师"},
 {:name=>"。", :natureStr=>"w", :newWord=>false, :offe=>69, :realName=>"。"}]

 "Ruby China，对！没错！这里就是 Ruby 社区，目前这里已经是国内最权威的 Ruby 社区，拥有国内所有资深的 Ruby 工程师。".拆(:words)
 => [{:freq=>2, :name=>"这里", :score=>16.315514814428745},
 {:freq=>2, :name=>"社区", :score=>14.99970404519092},
 {:freq=>2, :name=>"国内", :score=>13.684318222044968},
 {:freq=>1, :name=>"目前", :score=>5.3946562994797125},
 {:freq=>1, :name=>"已经", :score=>4.868333845606951},
 {:freq=>1, :name=>"权威", :score=>4.078866889481741},
 {:freq=>1, :name=>"所有", :score=>1.973668895869867},
 {:freq=>1, :name=>"资深", :score=>1.7105130430872182},
 {:freq=>1, :name=>"没错", :score=>1.4999705998354727},
 {:freq=>1, :name=>"就是", :score=>1.3683942314288522},
 {:freq=>1, :name=>"工程师", :score=>0.5263054050944183},
 {:freq=>1, :name=>"拥有", :score=>0.4999901999451576}]
```

*PS.* Built and tested on jRuby 9.1.6