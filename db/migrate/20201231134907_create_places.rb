class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :location
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
