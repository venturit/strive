class Admin::BaseController < ApplicationController
    load_and_authorize_resource
end
