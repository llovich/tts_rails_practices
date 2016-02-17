class CreateBogs < ActiveRecord::Migration
  def change
    create_table :bogs do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
