class AddBenchmarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :testcases, :jimple
    remove_column :testcases, :execute
    remove_column :testcases, :checker
    remove_column :testcases, :compile
    add_column :testcases, :result, :text
    add_column :testcases, :name, :text
  end
end
