class AddIndexToItemsTitleAndId < ActiveRecord::Migration
  def change
    add_index :items, [:id, :title], unique: { id: true, title: false }
  end
end
