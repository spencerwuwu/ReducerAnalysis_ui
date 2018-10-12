class AddResultTypeToBenchmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :testcases, :result_type, :integer
  end
end
