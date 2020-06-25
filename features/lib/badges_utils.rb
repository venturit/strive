# https://github.com/RailsApps/rails3-devise-rspec-cucumber
### UTILITY METHODS ###

def create_badge(name= "Bronze", image="bronze.png")
    image = fixture_file_upload(Rails.root.join('features', 'fixtures', 'files', image), 'image/png') 
    @badge ||= { :name => name, :emblem => image}
    @badge = FactoryBot.create(:badge, @badge)
end


def find_bage(name)
    @badge ||= Badge.where(:name => @badge[:name]).first
end

