# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.integer :release_year
      t.string :genre

      t.timestamps
    end
  end
end
