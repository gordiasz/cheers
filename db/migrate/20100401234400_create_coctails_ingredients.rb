class CreateCoctailsIngredients < ActiveRecord::Migration
  def self.up
    create_table :coctails_ingredients, :id => false do |t|
        t.integer :coctail_id, :null => false
        t.integer :ingredient_id, :null => false  
    end
    
    add_index :coctails_ingredients, [:coctail_id, :ingredient_id], :unique => true
  end

  def self.down
    remove_index :coctails_ingredients, :column => [:coctail_id, :ingredient_id]
    drop_table :coctails_ingredients
  end
end
