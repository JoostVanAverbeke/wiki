class Api::V1::AuthorResource < JSONAPI::Resource
  attributes :surname, :firstname, :birthdate
  has_many :articles
  filters :surname, :firstname, :birthdate
end