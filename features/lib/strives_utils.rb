# https://github.com/RailsApps/rails3-devise-rspec-cucumber
### UTILITY METHODS ###

def create_strive_category(name='Venturian')
    # @strive_category.destroy unless (@strive_category.nil? & @strive_category.name == name)
    @strive_category = FactoryBot.create(:strive_category,  {name: name})
end

def create_badge()
    @badge = FactoryBot.create(:badge)
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

def create_request() 
    create_requestor()
    create_requestee()
    create_backer()
    create_recipient()
    create_strive_category()
    create_badge()
    @request.destroy unless @request.nil?
    @request = FactoryBot.create(:request, {requestee_id: @requestee.id, requestor_id: @requestor.id, recipient_id: @recipient.id, backer_id: @backer.id, badge_id: @badge.id, strive_category_id: @strive_category.id, reason: "Lorem Ipsum"})
end

def create_strive() 
    create_requestee()
    create_recipient()
    create_strive_category()
    create_badge()
    @strive.destroy unless @strive.nil?
    @request = FactoryBot.create(:strive, {awarder_id: @requestee.id, awardee_id: @recipient.id, badge_id: @badge.id, strive_category_id: @strive_category.id, reason: "Lorem Ipsum"})
end