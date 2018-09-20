class CreateTestcases < ActiveRecord::Migration[5.2]
  def change
    create_table :testcases do |t|
      t.text :java
      t.text :compile
      t.text :jimple
      t.text :execute
      t.text :checker
      t.string :t1
      t.string :t2
      t.string :t3
      t.string :t4

      t.timestamps
    end
  end
end
