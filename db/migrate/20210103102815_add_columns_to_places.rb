class AddColumnsToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :country, :string
  end
end
