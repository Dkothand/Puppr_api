class Dog < ApplicationRecord
    validates :name, :breed, :zip_code, presence: true
    has_many :dog_photos
end