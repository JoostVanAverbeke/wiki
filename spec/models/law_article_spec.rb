require 'rails_helper'

RSpec.describe LawArticle, type: :model do
  let(:author) { FactoryGirl.create(:author) }
  let(:article) { FactoryGirl.create(:law_article_article, author: author) }
  let(:law_article) { article.descriptive }

  context 'Validation' do
    
    it 'is valid with valid attributes' do
      expect(law_article).to be_valid
    end
    
    it 'is not valid without a law' do
      law_article.law = nil
      expect(law_article).not_to be_valid
    end
    
    it 'is not valid without a subject' do
      law_article.article.subject = nil
      expect(law_article).not_to be_valid
    end
    
    it 'is not valid without an author' do
      law_article.article.author_id = nil
      expect(law_article).not_to be_valid
    end
    
  end
  
  context 'Creation' do
    
    it 'creates and saves the corresponding super class object article on creation' do
      expect { law_article }.to change(Article, :count).by(1)
    end

    it 'creates and saves a law article' do
      expect { law_article }.to change(LawArticle, :count).by(1)
    end

    it 'creates a LawArticle and corresponding article when specifying article_attributes' do

      my_law_article = LawArticle.new(law: 'Joost Law',
                                      article_attributes: { subject: 'my subject', author_id: author.id})
      my_law_article.article = Article.new unless my_law_article.article
      my_law_article.article.descriptive = my_law_article
      expect { my_law_article.article.save }.to change(Article, :count).by(1).and change(LawArticle, :count).by(1)
      
    end
  end
end
