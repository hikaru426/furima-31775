class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.references :user, foregn_key: true
      t.references :item, foregn_key: true
      t.timestamps
    end
  end
end
