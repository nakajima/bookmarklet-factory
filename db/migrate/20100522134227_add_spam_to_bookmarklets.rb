class AddSpamToBookmarklets < ActiveRecord::Migration
  def self.up
    add_column :bookmarklets, :spam, :boolean, :default => false
  end

  def self.down
    remove_column :bookmarklets, :spam
  end
end
