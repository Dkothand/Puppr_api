class User < ApplicationRecord
    # Active model method to set and authenticate against a bcrypt password
    has_secure_password
    # User has one-to-one relationship with dog table
    has_one :dog
end
