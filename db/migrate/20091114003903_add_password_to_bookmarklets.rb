class AddPasswordToBookmarklets < ActiveRecord::Migration
  def self.up
    add_column :bookmarklets, :password, :string
  end

  def self.down
    remove_column :bookmarklets, :password
  end
end
