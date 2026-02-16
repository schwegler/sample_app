# frozen_string_literal: true

class CreateWrestlingEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :wrestling_events do |t|
      t.string :title
      t.string :promotion
      t.date :date
      t.string :venue

      t.timestamps
    end
  end
end
