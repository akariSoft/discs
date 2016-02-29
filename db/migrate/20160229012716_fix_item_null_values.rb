class FixItemNullValues < ActiveRecord::Migration
  def change
    change_column_null :items, :title, false
    change_column_null :items, :episodes, false
    change_column_null :items, :discs, false
  end
end
