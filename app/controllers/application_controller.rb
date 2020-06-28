class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    layout :layout_by_resource

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 


    private

    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end


    def user_not_authorized
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html{ redirect_to request.referrer || root_path, alert: "You are not authorized to perform this action."}
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end
end
