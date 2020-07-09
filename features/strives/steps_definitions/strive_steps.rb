require_relative "#{Rails.root.join('features', 'lib')}/users_utils"
require_relative "#{Rails.root.join('features', 'lib')}/strives_utils"
require_relative "#{Rails.root.join('features', 'lib')}/badges_utils"


Given("I, Charles, signed in and visit requests page") do
    create_request()
    sign_in_user(@requestee)
    visit "/requests"
  end
  
  When("I click award strive") do
    click_link "Award Strive"
  end

  When("I click award strive to request that have already awarded") do
    click_link "Award Strive"
    path_url = user_strives_path(@request.requestee, request_id: @request.id)
    page.driver.post(path_url)
    visit page.driver.response.location
  end
  
  Then("the strive should get awarded") do
    page.should have_content "Strive was successfully awarded."
  end


  Then("the strive should not get awarded") do
    page.should have_content "Oh Snap! You can only award one strive per request."
  end


  Given("I, Charles, has already awarded a strive for Jane under Reliable category") do
    create_strive_category('Reliable')
    create_strive_category('Solver')
    create_strive_category('Expert')
    create_requestee()
    create_recipient()
    create_strive()
    sign_in_user(@requestee)
  end
  
  Given("I, visit Jane's page") do
    visit "/users/#{@recipient.id}"
  end
  
  When("I click award strive and award strive under Reliable category") do
    click_link "Award a Strive"
    select('Bronze', :from => 'strive_badge_id')
    select('Venturian', :from => 'strive_strive_category_id')
    fill_in "strive_reason", :with => "Joe Cocker for going above and beyond to help with docker deployment"
    click_button "Award this Strive"
  end
  
  Then("the system block the strive creation") do
    page.should have_content "Oh Snap! You have already awarded a similar strive in the last two weeks."
  end