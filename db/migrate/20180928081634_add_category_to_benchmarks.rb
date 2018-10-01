class AddCategoryToBenchmarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :testcases, :compile_error
    add_column :testcases, :comment, :string
    add_column :testcases, :source, :string
  end
end
