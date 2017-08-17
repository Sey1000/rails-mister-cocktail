class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, :cocktail, :ingredient, presence: true
  validates :ingredient, uniqueness: {
    scope: :cocktail,
    message: "A Cocktail can only have one dose of an ingredient"
  }
end
