class AddJqueryToBookmarklets < ActiveRecord::Migration
  def self.up
    add_column :bookmarklets, :jquery, :boolean, :default => false
  end

  def self.down
    remove_column :bookmarklets, :jquery
  end
end
