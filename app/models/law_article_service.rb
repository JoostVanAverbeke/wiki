class LawArticleService

  def initialize(law_article)
    @law_article = law_article
  end

  def make_descriptive
    @law_article.article = Article.new unless @law_article.article
    @law_article.article.descriptive = @law_article
    @law_article
  end
end