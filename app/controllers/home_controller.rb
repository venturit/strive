class HomeController < ApplicationController
  def index
    @users = User.where(active: true).all
  end
end
