class HomeController < ApplicationController
  def index
    @users = User.leaderboard
  end
end
