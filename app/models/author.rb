class Author < ApplicationRecord
  include Filterable

  has_many :articles
  validates_presence_of :surname
end
