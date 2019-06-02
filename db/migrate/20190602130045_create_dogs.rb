class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :temperament
      t.string :bio
      t.integer :zip_code
    end
  end
end
