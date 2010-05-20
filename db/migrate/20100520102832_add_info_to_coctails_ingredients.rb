class AddInfoToCoctailsIngredients < ActiveRecord::Migration
  def self.up
    add_column :coctails_ingredients, :info, :string
  end

  def self.down
    remove_column :coctails_ingredients, :info
  end
end
