class User < ApplicationRecord
  has_one_attached :avatar
  devise :database_authenticatable,
        :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

end
