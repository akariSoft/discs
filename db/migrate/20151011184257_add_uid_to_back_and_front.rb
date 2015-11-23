class AddUidToBackAndFront < ActiveRecord::Migration
  def change
    add_column :items, :front_uid, :string
    add_column :items, :back_uid, :string
  end
end
