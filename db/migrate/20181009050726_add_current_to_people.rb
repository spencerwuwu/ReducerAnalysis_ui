class AddCurrentToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :is_current, :boolean
  end
end
