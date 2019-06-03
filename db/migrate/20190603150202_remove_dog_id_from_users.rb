class RemoveDogIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :dog_id
  end
end
