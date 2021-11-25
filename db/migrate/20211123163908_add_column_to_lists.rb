class AddColumnToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :prebookspot, :boolean
  end
end
