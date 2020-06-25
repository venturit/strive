require_relative "#{Rails.root.join('features', 'lib')}/users_utils"
require_relative "#{Rails.root.join('features', 'lib')}/badges_utils"

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


  Given("I signed in and visit edit badge page") do
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


  When("I try to create a new badge by entering information of an existing badge in the system") do
    create_badge
    fill_in "badge_name", :with => "Bronze"
    fill_in "badge_reward", :with => 5.00
    fill_in "badge_notes", :with => "$5 worth of rewards"
    click_button "Save"
  end
  
  Then("the system should prevent me from creating a duplicate badge") do
    page.should have_content "Name has already been taken Reward has already been taken"
  end