class AddAuthorToCoctail < ActiveRecord::Migration
  def self.up
    add_column :coctails, :user_id, :integer
  end

  def self.down
    remove_column :coctails, :user_id
  end
end
