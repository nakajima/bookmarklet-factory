class AddHighlightedCodeToBookmarklets < ActiveRecord::Migration
  def self.up
    add_column :bookmarklets, :highlighted_code, :text
  end

  def self.down
    remove_column :bookmarklets, :highlighted_code
  end
end
