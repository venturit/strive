# https://github.com/RailsApps/rails3-devise-rspec-cucumber
### UTILITY METHODS ###

def create_strive_category()
    @strive_category = FactoryBot.create(:strive_category)
end


def find_bage(name)
    @strive_category ||= StriveCategory.where(:name => @strive_category[:name]).first
end

