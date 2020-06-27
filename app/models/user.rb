class User < ApplicationRecord
  has_one_attached :avatar
  devise :database_authenticatable,
        :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable
  validates :name, presence: true

  ROLES = {1=> :teammate, 2=> :supervisor, 3=> :project_manager, 4=> :client_manager, 5=> :director}


end
