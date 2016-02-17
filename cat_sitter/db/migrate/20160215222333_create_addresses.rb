class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :breed
      t.string :owner
      t.string :address

      t.timestamps null: false
    end
  end
end
