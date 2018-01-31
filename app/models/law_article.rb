class LawArticle < ApplicationRecord
  has_one :article, :as => :descriptive, :dependent => :destroy
  accepts_nested_attributes_for :article, :allow_destroy => true
  validates_presence_of :law
end
