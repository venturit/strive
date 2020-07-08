class User < ApplicationRecord
  has_one_attached :avatar
  devise :database_authenticatable,
        :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable
  validates :name, presence: true

  has_many :strives, class_name: "Strive", :foreign_key => :awardee_id

  has_many :requests, class_name: "Request", :foreign_key => :recipient_id

  ROLES = {1=> :teammate, 2=> :supervisor, 3=> :project_manager, 4=> :client_manager, 5=> :director}

  def strive_by_category(strive_category_id) 
    strivez = self.strives.where(strive_category_id: strive_category_id).all
    # # sort the badges
    # bronzes = []
    # silver = []
    # gold = []
    # platinum = []

    # bns = strivez.where(badge_id: 1).each do ||
    # end

  end

  def points
    self.strives.size
  end

  #get the rank  
  def rank
    ranc = 0
    ranks = Strive.group('awardee_id').order('count_id desc').count('id')
    ranks.each_with_index do |(key,value),index|
      if key == self.id
        ranc = index+1
      end
    end
    return ranc
  end


  def self.leaderboard
    # TODO: optimize 
    leaders = User.where(id: Strive.group('awardee_id').order('count_id desc').count('id').keys).where(active: true).all
    others = User.where.not(id: leaders).where(active: true).all
    all_users = leaders + others
    return all_users
  end

end
