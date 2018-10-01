class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :url
      t.string :description
      t.string :email
      t.string :img_name
      t.boolean :is_contact

      t.timestamps
    end
  end
end
