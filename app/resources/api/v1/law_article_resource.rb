class Api::V1::LawArticleResource < JSONAPI::Resource
  attributes :law
  has_one :article, polymorphic: true, foreign_key: 'descriptive_id'
end