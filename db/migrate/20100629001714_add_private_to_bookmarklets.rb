class AddPrivateToBookmarklets < ActiveRecord::Migration
  def self.up
    add_column :bookmarklets, :private, :boolean, :default => false
  end

  def self.down
    remove_column :bookmarklets, :private
  end
end
