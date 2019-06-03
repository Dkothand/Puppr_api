class User < ApplicationRecord
    # Active model method to set and authenticate against a bcrypt password
    has_secure_password
end
