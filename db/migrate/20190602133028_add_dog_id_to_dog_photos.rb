class AddDogIdToDogPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :dog_photos, :dog_id, :integer
  end
end
