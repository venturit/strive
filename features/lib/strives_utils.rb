# https://github.com/RailsApps/rails3-devise-rspec-cucumber
### UTILITY METHODS ###

def create_strive_category()
    @strive_category = FactoryBot.create(:strive_category)
end


def find_strive_category(name)
    @strive_category ||= StriveCategory.where(:name => @strive_category[:name]).first
end


def create_backer(name="Kapil Deo", email = "k.deo@venturit.com", role=1)
    @backer ||= User.where(email: email).first
    @backer.destroy unless @backer.nil?
    @backer = FactoryBot.create(:user, {name: name, email: email, role: role})
end

def create_recipient(name="Joe Warans", email = "j.warans@venturit.com", role=1)
    @recipient ||= User.where(email: email).first
    @recipient.destroy unless @recipient.nil?
    @recipient = FactoryBot.create(:user, {name: name, email: email, role: role})
end

def create_requestor(name="Jane Cocker", email = "j.cocker@venturit.com", role=1)
    @requestor ||= User.where(email: email).first
    @requestor.destroy unless @requestor.nil?
    @requestor = FactoryBot.create(:user, {name: name, email: email, role: role})
end

def create_requestee(name="Charles Wood", email = "c.wood@venturit.com", role=5)
    @requestee ||= User.where(email: email).first
    @requestee.destroy unless @requestee.nil?
    @requestee = FactoryBot.create(:user, {name: name, email: email, role: role})
end