class CreateGenres < ActiveRecord::Migration
  def change
    remove_column :items, :genre, :text

    create_table :genres do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    create_table :genres_items, id: false do |t|
      t.belongs_to :item, index: true
      t.belongs_to :genre, index: true
    end
  end
end
