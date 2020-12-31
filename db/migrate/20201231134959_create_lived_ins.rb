class CreateLivedIns < ActiveRecord::Migration[6.0]
  def change
    create_table :lived_ins do |t|
      t.integer :year
      t.references :place, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
