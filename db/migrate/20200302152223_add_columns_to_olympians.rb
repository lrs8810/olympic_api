class AddColumnsToOlympians < ActiveRecord::Migration[5.2]
  def change
    add_reference :olympians, :sport, foreign_key: true
    add_reference :olympians, :team, foreign_key: true
  end
end
