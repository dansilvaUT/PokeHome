class Pokemon < ApplicationRecord
    belongs_to :user
    validates :name, :dex_id, :moves, :images, presence: true
end
