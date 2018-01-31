require 'rails_helper'

RSpec.describe LawArticleService, type: :model do
  let(:author) { FactoryGirl.create(:author) }
  let(:law_article)  { LawArticle.new(law: 'Joost Law',
                                     article_attributes: { subject: 'my subject', author_id: author.id}) }
  let(:law_article_service)  { LawArticleService.new(law_article) }
  
  it 'creates the descriptive association' do
    expect(law_article_service.make_descriptive).to be(law_article)
    expect(law_article.article).not_to be_nil
    expect(law_article.article.descriptive).to be(law_article)
  end

  it 'saves an law_article and corresponding article association' do
    expect { law_article_service.make_descriptive.article.save }.to change(Article, :count).by(1).and change(LawArticle, :count).by(1)
  end
end