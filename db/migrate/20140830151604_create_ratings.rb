class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
