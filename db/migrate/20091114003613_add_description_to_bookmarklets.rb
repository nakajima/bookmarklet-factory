class AddDescriptionToBookmarklets < ActiveRecord::Migration
  def self.up
    add_column :bookmarklets, :description, :text
  end

  def self.down
    remove_column :bookmarklets, :description
  end
end
