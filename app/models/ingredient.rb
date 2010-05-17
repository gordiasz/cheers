class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :coctails
  
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
