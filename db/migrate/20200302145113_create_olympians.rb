class CreateOlympians < ActiveRecord::Migration[5.2]
  def change
    create_table :olympians do |t|
      t.string :full_name
      t.string :sex
      t.integer :age
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
