class Ingredient < ApplicationRecord
  ATTRIBUTES = %i[name]
  validates :name, presence: true, uniqueness: true
  has_many :doses
end
