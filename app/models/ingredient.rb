class Ingredient < ActiveRecord::Base
  has_many :coctails_ingredients
  has_many :coctails, :through => :coctails_ingredients
  
  def self.get_or_create_by_name(name)
    ing = Ingredient.first(:conditions => ["name = ?", name])
    if ing == nil
      ing = Ingredient.new
      ing.name = name
      ing.save
    end
    return ing
  end
end
