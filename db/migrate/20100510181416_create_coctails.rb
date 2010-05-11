class CreateCoctails < ActiveRecord::Migration
  def self.up
    create_table :coctails do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :coctails
  end
end
