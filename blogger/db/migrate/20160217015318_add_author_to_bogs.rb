class AddAuthorToBogs < ActiveRecord::Migration
  def change
    add_column :bogs, :author, :string
  end
end
