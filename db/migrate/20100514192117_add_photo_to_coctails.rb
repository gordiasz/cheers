class AddPhotoToCoctails < ActiveRecord::Migration
  def self.up
    add_column :coctails, :photo, :binary
  end

  def self.down
    remove_column :coctails, :photo
  end
end
