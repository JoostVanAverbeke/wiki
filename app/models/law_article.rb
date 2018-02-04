class LawArticle < ApplicationRecord
  include Filterable
  
  has_one :article, :as => :descriptive, :dependent => :destroy
  accepts_nested_attributes_for :article, :allow_destroy => true
  validates_presence_of :law

  def as_json(options = {})
    super(include: { article: { include: :author}})
  end
end
