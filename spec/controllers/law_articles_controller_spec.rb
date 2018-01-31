require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe LawArticlesController, type: :controller do

  let(:author) { FactoryGirl.create(:author) }
  # This should return the minimal set of attributes required to create a valid
  # LawArticle. As you add validations to LawArticle, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { law: 'A law article', article_attributes: { subject: 'Law subject', author_id: author.id} }
  }

  let(:invalid_attributes) {
    { created_at: Time.now, updated_at: Time.now }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LawArticlesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all law_articles as @law_articles" do
      law_article_service = LawArticleService.new(LawArticle.new(valid_attributes))
      law_article = law_article_service.make_descriptive
      law_article.article.save
      get :index, params: {}, session: valid_session
      expect(assigns(:law_articles)).to eq([law_article])
    end
  end

  describe "GET #show" do
    it "assigns the requested law_article as @law_article" do
      law_article_service = LawArticleService.new(LawArticle.new(valid_attributes))
      law_article = law_article_service.make_descriptive
      law_article.article.save
      get :show, params: {id: law_article.to_param}, session: valid_session
      expect(assigns(:law_article)).to eq(law_article)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new LawArticle" do
        expect {
          post :create, params: {law_article: valid_attributes}, session: valid_session
        }.to change(LawArticle, :count).by(1)
      end

      it "assigns a newly created law_article as @law_article" do
        post :create, params: {law_article: valid_attributes}, session: valid_session
        expect(assigns(:law_article)).to be_a(LawArticle)
        expect(assigns(:law_article)).to be_persisted
      end

     end

    context "with invalid params" do
      xit "assigns a newly created but unsaved law_article as @law_article" do
        post :create, params: {law_article: invalid_attributes}, session: valid_session
        expect(assigns(:law_article)).to be_a_new(LawArticle)
      end

    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { law: 'The updated law article'}
      }

      it "updates the requested law_article" do
        law_article_service = LawArticleService.new(LawArticle.new(valid_attributes))
        law_article = law_article_service.make_descriptive
        law_article.article.save
        put :update, params: {id: law_article.to_param, law_article: new_attributes}, session: valid_session
        law_article.reload
        puts law_article.law
        expect(law_article.law).to eq('The updated law article')
        
      end

      it "assigns the requested law_article as @law_article" do
        law_article_service = LawArticleService.new(LawArticle.new(valid_attributes))
        law_article = law_article_service.make_descriptive
        law_article.article.save
        put :update, params: {id: law_article.to_param, law_article: valid_attributes}, session: valid_session
        expect(assigns(:law_article)).to eq(law_article)
      end

    end

    context "with invalid params" do
      it "assigns the law_article as @law_article" do
        law_article_service = LawArticleService.new(LawArticle.new(valid_attributes))
        law_article = law_article_service.make_descriptive
        law_article.article.save
        put :update, params: {id: law_article.to_param, law_article: invalid_attributes}, session: valid_session
        expect(assigns(:law_article)).to eq(law_article)
      end

    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested law_article" do
      law_article_service = LawArticleService.new(LawArticle.new(valid_attributes))
      law_article = law_article_service.make_descriptive
      law_article.article.save
      expect {
        delete :destroy, params: {id: law_article.to_param}, session: valid_session
      }.to change(LawArticle, :count).by(-1)
    end

  end

end
