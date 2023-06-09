class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true, on: :create
    validates :password, presence: true, on: :create
    has_many :pokemons
end
