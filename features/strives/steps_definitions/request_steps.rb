require_relative "#{Rails.root.join('features', 'lib')}/users_utils"
require_relative "#{Rails.root.join('features', 'lib')}/strives_utils"
require_relative "#{Rails.root.join('features', 'lib')}/badges_utils"


Given("I signed in and visit request a strive page") do
    create_badge()
    create_strive_category()
    create_backer()
    create_recipient()
    create_requestor()
    create_requestee()
    sign_in_user(@requestor)
    visit "/requests/new"
  end
  
  When("I create a request entering request information") do
    select('Bronze', :from => 'request_badge_id')
    select('Venturian', :from => 'request_strive_category_id')
    select('Charles Wood', :from => 'request_requestee_id')
    select('Joe Warans', :from => 'request_recipient_id')
    select('Kapil Deo', :from => 'request_backer_id')
    fill_in "request_reason", :with => "Joe Cocker for going above and beyond to help with docker deployment"
    click_button "Save"
  end
  
  Then("the request should get created without errors") do
    page.should have_no_content "error"
  end