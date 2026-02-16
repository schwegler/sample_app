# frozen_string_literal: true

class CreateComics < ActiveRecord::Migration[7.1]
  def change
    create_table :comics do |t|
      t.string :title
      t.integer :issue_number
      t.string :publisher
      t.string :writer
      t.string :artist

      t.timestamps
    end
  end
end
