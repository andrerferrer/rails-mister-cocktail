class Dose < ApplicationRecord
  ATTRIBUTES= %i[description cocktail]
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
end
