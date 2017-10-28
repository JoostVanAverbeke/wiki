class LawArticle < ApplicationRecord
  has_one :article, :as => :descriptive, :dependent => :destroy
end
