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
    page.should have_no_content "Request can award only one strive"
  end


  Then("the strive should not get awarded") do
    page.should have_content "Request can award only one strive"
  end
