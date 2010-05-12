class AddRecipeToCoctails < ActiveRecord::Migration
  def self.up
    add_column :coctails, :recipe, :text
  end

  def self.down
    remove_column :coctails, :recipe
  end
end
