Given("I am John") do
    create_user
  end
  
  Given("Jane is a valid user") do
    create_user2(name="Jane Prueba",email = "jp2@example.com")
  end

  When("I search for Jane") do
    sign_in
    visit "/" 
    fill_in "auto_search", :with => "Jane"
  end
  
  Then("I should get see her in the search results") do
    expect(page).to have_content("Jane Prueba")
  end