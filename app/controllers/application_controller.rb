class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    layout :layout_by_resource

    private

    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end
    # TODO:
    # rescue_from CanCan::AccessDenied do |exception|
    #   respond_to do |format|
    #     format.json { head :forbidden, content_type: 'text/html' }
    #     format.html { redirect_to main_app.root_url, notice: exception.message }
    #     format.js   { head :forbidden, content_type: 'text/html' }
    #   end
    # end


end
