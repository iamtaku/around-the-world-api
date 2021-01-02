class AddPlaceToPerson < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :place, null: true, foreign_key: true
  end
end
