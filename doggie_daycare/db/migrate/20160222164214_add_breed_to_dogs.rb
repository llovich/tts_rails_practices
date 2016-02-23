class AddBreedToDogs < ActiveRecord::Migration
  def change
    add_reference :dogs, :breed, index: true, foreign_key: true
  end
end
