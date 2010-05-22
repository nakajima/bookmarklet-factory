class ScrewTheColumn < ActiveRecord::Migration
  def self.up
    remove_column :bookmarklets, :spam
  end

  def self.down
  end
end
