class AddMovieId < ActiveRecord::Migration
  def change
    add_column :customers, :movie_id, :integer

  end
end
