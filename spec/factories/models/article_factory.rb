FactoryGirl.define do
  factory :law_article_article, class: 'Article' do
    subject 'Article subject'
    association :descriptive, factory: :law_article
  end
end