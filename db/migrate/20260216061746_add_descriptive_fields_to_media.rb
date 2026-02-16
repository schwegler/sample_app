class AddDescriptiveFieldsToMedia < ActiveRecord::Migration[7.1]
  def change
    add_column :albums, :publication_date, :date
    add_column :albums, :listened_on, :date

    add_column :comics, :publication_date, :date
    add_column :comics, :read_on, :date

    add_column :movies, :publication_date, :date
    add_column :movies, :watched_on, :date

    add_column :tv_shows, :publication_date, :date
    add_column :tv_shows, :watched_on, :date

    add_column :wrestling_events, :watched_on, :date
  end
end
