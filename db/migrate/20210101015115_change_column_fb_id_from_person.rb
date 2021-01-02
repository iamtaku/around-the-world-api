class ChangeColumnFbIdFromPerson < ActiveRecord::Migration[6.0]
  def change
    change_column :people,
    :fb_id, :bigint
  end
end
