class Dog < ApplicationRecord
    # requires fields have data when creating new dog
    validates :name, :breed, :zip_code, presence: true
    # one dog has many dog_photos
    has_many :dog_photos
end