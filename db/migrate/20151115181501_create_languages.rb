class CreateLanguages < ActiveRecord::Migration
  def change
    remove_column :items, :language, :string

    create_table :languages do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    create_table :items_languages, id: false do |t|
      t.belongs_to :item, index: true
      t.belongs_to :language, index: true
    end
  end
end
