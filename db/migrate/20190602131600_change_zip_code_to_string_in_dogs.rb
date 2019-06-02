class ChangeZipCodeToStringInDogs < ActiveRecord::Migration[5.2]
  def change
    change_column :dogs, :zip_code, :string
  end
end
