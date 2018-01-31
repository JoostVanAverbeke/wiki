require 'rails_helper'

RSpec.describe "LawArticles", type: :request do
  
  let(:author) { FactoryGirl.create(:author) }
  let(:law_articles_params) {
    {
        "law_article" => {
            "law" => "My Law",
            "article_attributes" => {
                "subject" => "My Subject",
                "author_id" => author.id
            }
        }
    }
  }
  context "GET /law_articles" do
    it "works! (now write some real specs)" do
      get law_articles_path
      expect(response).to have_http_status(200)
    end
  end

  context 'POST law_articles' do
    it 'creates a law article and an article association' do
      headers = { "CONTENT_TYPE" => "application/json" }
      expect { post '/law_articles', params: law_articles_params.to_json,
           headers: headers }.to change(LawArticle, :count).by(1).and change(Article, :count).by(1)
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:created)
    end
    
  end
end
