require_relative '../../lib/users_utils'

# admin
Given /^I am an admin$/ do
    create_admin
end

Given /^I am a user$/ do
    create_user
end


Given("I signed in with valid admin credentials") do
    admin_sign_in
end

Given("I signed in with valid credentials") do
    sign_in
end

Given("I visit new user page") do
    visit "admin/users/new"
end

Given("I try to visit admin new user page") do
    begin
        visit "admin/users/new"
    rescue => @unauthorized_error
    
    end
end

When("I create a new user by entering user information") do
    @email_address=rand_email
    fill_in "user_name", :with => "John Doe"
    fill_in "user_email", :with => @email_address
    fill_in "user_password", :with => "jOhnrockZ"
    fill_in "user_password_confirmation", :with => "jOhnrockZ"
    click_button "Create"
end

When("I try to create a new user by entering user information") do    
    begin
        @email_address=rand_email
        fill_in "user_name", :with => "John Doe"
        fill_in "user_email", :with => @email_address
        fill_in "user_password", :with => "jOhnrockZ"
        fill_in "user_password_confirmation", :with => "jOhnrockZ"
        click_button "Create"
    rescue => @field_error
    end
end


Then("the user should get an invite email") do
    email = ActionMailer::Base.deliveries.first
    email.to[0].should == @email_address
    email.body.should include("You can confirm your account email through the link below")
end


Then("I should get an unauthorized error") do
    @unauthorized_error.class.to_s.should == "CanCan::AccessDenied"
end

##
#TODO: Test email deliver for spam testing (requires MailSlurp)
# When("I create a new user by entering user information") do
#     email_helper
#     @email_address=@inbox.email_address
#     fill_in "user_name", :with => "John Doe"
#     fill_in "user_email", :with => @email_address
#     fill_in "user_password", :with => "jOhnrockZ"
#     fill_in "user_password_confirmation", :with => "jOhnrockZ"
#     click_button "Create"
# end
# Then("the user should get an invite email") do
#     # email_wait_helper
#     # opts = {
#     #     inbox_id: @inbox.id, # String | Id of the inbox we are fetching emails from
#     #     timeout: 1000, # Integer | Max milliseconds to wait
#     #     unread_only: false # Boolean | Optional filter for unread only.
#     #   }
#     # received_email = @wait_api_instance.wait_for_latest_email(opts)
#     # puts received_email
#     # pending # Write code here that turns the phrase above into concrete actions
# end
##