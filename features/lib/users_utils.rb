# https://github.com/RailsApps/rails3-devise-rspec-cucumber
### UTILITY METHODS ###

def create_visitor(name= "John Prueba",email = "jp@example.com")
    @visitor ||= { :name => name, :email => email,
    :password => "changeme", :password_confirmation => "changeme" }
end

def create_admin_visitor
    @admin ||= { name: "Admin User", email: "johncena@example.com",
    password: "daddyhome", password_confirmation: "daddyhome", admin: true }
end

def find_user
    @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
    create_visitor
    delete_user
    sign_up
    visit '/users/sign_out'
end

def create_user(name="John Prueba",email = "jp@example.com")
    create_visitor(name,email)
    delete_user
    @user = FactoryBot.create(:user, @visitor)
end

def create_user2(name="John Prueba",email = "jp@example.com")
    @visitor2 = create_visitor(name,email)
    delete_user2
    @user2 = FactoryBot.create(:user, @visitor)
end

def create_admin
    create_admin_visitor
    delete_admin
    @admin_user = FactoryBot.create(:user, @admin)
end


def delete_user
    @user ||= User.where(:email => @visitor[:email]).first
    @user.destroy unless @user.nil?
end

def delete_user2
    @user2 ||= User.where(:email => @visitor2[:email]).first
    @user2.destroy unless @user.nil?
end

def delete_admin
    @admin_user ||= User.where(:email => @admin[:email]).first
    @admin_user.destroy unless @admin_user.nil?
end

def sign_up
    delete_user
    visit '/users/sign_up'
    fill_in "user_name", :with => @visitor[:name]
    fill_in "user_email", :with => @visitor[:email]
    fill_in "user_password", :with => @visitor[:password]
    fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
    click_button "Sign up"
    find_user
end

def sign_in
    visit '/users/sign_in'
    fill_in "user_email", :with => @visitor[:email]
    fill_in "user_password", :with => @visitor[:password]
    click_button "Log in"
end

def admin_sign_in
    visit '/users/sign_in'
    fill_in "user_email", :with => @admin[:email]
    fill_in "user_password", :with => @admin[:password]
    click_button "Log in"
end


def rand_email
    "john#{rand(19)}@example.com"
end
##
# the following helper methods help to do end to end email testing with MailSlurp. 
# Note: MailSlurp has limited API calls for free

# require 'mailslurp_client'

# def email_helper
#     # Setup mailslurp
#     MailSlurpClient.configure do |config|
#         config.api_key['x-api-key'] = ENV['MAIL_SLURP_API_KEY']
#     end
#     api_instance = MailSlurpClient::CommonActionsControllerApi.new
#     @inbox = api_instance.create_new_email_address
# end

# def email_wait_helper
#     # Setup mailslurp
#     MailSlurpClient.configure do |config|
#         config.api_key['x-api-key'] = ENV['MAIL_SLURP_API_KEY']
#     end
#     @wait_api_instance = MailSlurpClient::WaitForControllerApi.new
# end
##
