class RemoveBreedFromDogs < ActiveRecord::Migration
  def change
    remove_column :dogs, :breed, :string
  end
end
