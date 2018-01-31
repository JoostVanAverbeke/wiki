require "rails_helper"

RSpec.describe LawArticlesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/law_articles").to route_to("law_articles#index")
    end

    it "routes to #show" do
      expect(:get => "/law_articles/1").to route_to("law_articles#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/law_articles").to route_to("law_articles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/law_articles/1").to route_to("law_articles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/law_articles/1").to route_to("law_articles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/law_articles/1").to route_to("law_articles#destroy", :id => "1")
    end

  end
end
