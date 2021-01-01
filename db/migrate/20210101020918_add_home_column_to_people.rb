class AddHomeColumnToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :home, :string
  end
end
