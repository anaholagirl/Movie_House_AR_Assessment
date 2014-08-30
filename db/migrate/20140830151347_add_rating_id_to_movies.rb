class AddRatingIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rating_id, :integer
  end
end
