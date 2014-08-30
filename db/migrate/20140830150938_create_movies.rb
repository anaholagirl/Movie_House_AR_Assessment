class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
