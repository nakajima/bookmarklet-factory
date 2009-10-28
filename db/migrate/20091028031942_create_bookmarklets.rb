class CreateBookmarklets < ActiveRecord::Migration
  def self.up
    create_table :bookmarklets do |t|
      t.string  :name
      t.text    :code
      t.integer :count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarklets
  end
end
