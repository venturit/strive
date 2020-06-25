class Badge < ApplicationRecord
    has_one_attached :emblem
    validates :name, presence: true, uniqueness: true
    validates :reward, presence: true, uniqueness: true
    validates :notes, presence: true
end
