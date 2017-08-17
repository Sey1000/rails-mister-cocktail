class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses, before_remove: :check_cocktails

  validates :name, presence: true, uniqueness: true

  def check_cocktails
    return true unless cocktails.count > 0
    errors.add :base, "Cannot delete ingredient that is being used in at least one cocktail"
  end
end
