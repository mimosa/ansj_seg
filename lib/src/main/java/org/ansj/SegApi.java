package org.ansj;

import org.ansj.splitWord.analysis.ToAnalysis;
import org.ansj.splitWord.analysis.NlpAnalysis;
import org.ansj.app.keyword.KeyWordComputer;

public class SegApi {
  
  /**
   * 分词服务，默认 ToAnalysis 分词
   * @param content 需要分词的文本
   * @return 分词后的结果集
   */
  @Execute
  public Object toSeg(String content){
    return ToAnalysis.parse(content).getTerms();
  }
  
  /**
   * 分词服务，默认 NlpAnalysis 分词
   * @param content 需要分词的文本
   * @return 分词后的结果集
   */
  @Execute
  public Object nlpSeg(String content){
    return NlpAnalysis.parse(content).getTerms();
  }
  
  /**
   * 关键词抽取
   * @param content 需要抽取关键词的文本
   * @return 关键词的结果集
   */
  @Execute
  public Object keyWord(String content){
    return new KeyWordComputer(20).computeArticleTfidf(content);
  }
  
}