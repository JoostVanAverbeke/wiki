class Api::V1::ArticleResource < JSONAPI::Resource
  attributes :created_at, :subject, :author_name, :description, :descriptive_type

  def author_name
    "#{@model.author.firstname} #{@model.author.surname}"
  end
end