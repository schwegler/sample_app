# frozen_string_literal: true

class CreateTvShows < ActiveRecord::Migration[7.1]
  def change
    create_table :tv_shows do |t|
      t.string :title
      t.integer :season
      t.integer :episode
      t.string :network

      t.timestamps
    end
  end
end
