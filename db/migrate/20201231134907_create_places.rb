class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :location
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
