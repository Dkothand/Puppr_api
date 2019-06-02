class CreateDogPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_photos do |t|
      t.string :img_link
      t.string :details

      t.timestamps
    end
  end
end
