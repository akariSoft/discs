class AddIndexToItemsTitleAndId < ActiveRecord::Migration
  def change
    add_index :items, :id, unique: true, name: 'index_items_on_item_id'
    add_index :items, :title, name: 'index_items_on_item_title'
  end
end
