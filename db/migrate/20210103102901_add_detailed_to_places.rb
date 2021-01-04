class AddDetailedToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :detailed, :string
  end
end
