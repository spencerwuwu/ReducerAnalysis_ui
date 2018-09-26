class AddTypeToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :testcases, :r_type, :string
    add_column :testcases, :compile_error, :integer
  end
end
