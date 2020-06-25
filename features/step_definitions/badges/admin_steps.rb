require_relative '../../lib/users_utils'
require_relative '../../lib/badges_utils'

Given("I signed in and visit create new badge page") do
    create_admin
    admin_sign_in
    visit "/admin/badges/new"
    end

  When("I create a new badge by entering information") do
    fill_in "badge_name", :with => "Silver"
    fill_in "badge_reward", :with => 20.00
    fill_in "badge_notes", :with => "$20 worth of rewards"
    click_button "Save"
  end
  
  Then("the badge should get created") do
    page.should have_content "Silver"
  end


  Given("I signed in and visit edit new badge page") do
    create_badge
    create_admin
    admin_sign_in
    visit "/admin/badges/#{@badge.id}/edit"
  end
  
  When("I update the badge name and save it") do
    fill_in "badge_name", :with => "Silvery"
    click_button "Save"
  end
  
  Then("the badge name should get updated") do
    page.should have_content "Silvery"
  end