class Article < ApplicationRecord
  belongs_to :descriptive, polymorphic: true
  has_and_belongs_to_many :tags
  belongs_to :author, optional: true
  has_many :comments
  has_many :chapters

  validates_presence_of :subject, :author_id, :descriptive_type
end
