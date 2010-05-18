class RemoveAuthorFromComment < ActiveRecord::Migration
  def self.up
    remove_column :comments, :author
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
