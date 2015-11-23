class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :alt_title
      t.text :info
      t.string :language
      t.string :episodes
      t.integer :discs
      t.text :details

      t.timestamps null: false
    end
  end
end
