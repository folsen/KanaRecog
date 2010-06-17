class CreateWords < ActiveRecord::Migration
  def self.up
    create_table :words do |t|
      t.integer :kind
      t.string :kana
      t.string :romaji
      t.string :meaning

      t.timestamps
    end
  end

  def self.down
    drop_table :words
  end
end
