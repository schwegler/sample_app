class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.integer :release_year
      t.string :rating

      t.timestamps
    end
  end
end
