class AddDogIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dog_id, :integer
  end
end
