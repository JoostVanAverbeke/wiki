class Section < ApplicationRecord
  has_many :texts
  has_many :subsections, class_name: "Section", foreign_key: :section_id
  belongs_to :section
  belongs_to :chapter
end
