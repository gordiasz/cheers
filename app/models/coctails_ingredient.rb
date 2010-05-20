class CoctailsIngredient < ActiveRecord::Base
  belongs_to :coctail
  belongs_to :ingredient
  
end
