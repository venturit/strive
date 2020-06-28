class Admin::BaseController < ApplicationController
    before_action :authorized_admin
    # after_action :verify_policy_scoped

    private 
    def authorized_admin
        authorize :admin
    end
end
