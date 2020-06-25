require_relative "#{Rails.root.join('features', 'lib')}/users_utils"
require_relative "#{Rails.root.join('features', 'lib')}/strives_utils"

Given("I signed in and visit create new strive category page") do
    create_admin
    admin_sign_in
    visit "/admin/strive_categories/new"
    end

  When("I create a new strive category by entering information") do
    fill_in "strive_category_name", :with => "Reliable"
    fill_in "strive_category_description", :with => "Means able to deliver on time and teammates can count on them "
    click_button "Save"
  end

  Then("the strive category should get created") do
    page.should have_content "Reliable"
  end


  Given("I signed in and visit edit strive category page") do
    create_strive_category
    create_admin
    admin_sign_in
    visit "/admin/strive_categories/#{@strive_category.id}/edit"
  end
  
  When("I update the strive category description and save it") do
    fill_in "strive_category_description", :with => "Adheres to Venturit culture, Being Honest, Encouraging, Transparent, Fun, Respect for others, Equality"
    click_button "Save"
  end
  
  Then("the strive category description should get updated") do
    page.should have_content "Equality"
  end