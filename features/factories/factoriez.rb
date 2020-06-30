include ActionDispatch::TestProcess

FactoryBot.define do

  factory :user do
    name {'Test User'}
    email { "example@example.com" }
    password { "changeme" }
    password_confirmation { "changeme" }
    admin { false }
    active { true }
    confirmed_at {Time.now}
    role {1}
    avatar {fixture_file_upload(Rails.root.join('features', 'fixtures', 'files', 'user.png'), 'image/png') }
  end


  factory :badge do
    name {'Bronze'}
    reward {5.00}
    notes {'Reward value worth $5.00'}
    emblem {fixture_file_upload(Rails.root.join('features', 'fixtures', 'files', 'bronze.png'), 'image/png') }
  end


  factory :strive_category do
    name {'Venturian'}
    description {'Adheres to Venturit culture, Being Honest, Encouraging, Transparent, Fun, Respect for others, etc'}
  end


  factory :request do
    requestor_id {}
    recipient_id {}
    badge_id {}
    reason {}
    strive_category_id {}
    backer_id {}
  end


  factory :strive do
    awarder_id {}
    awardee_id {}
    badge_id {}
    strive_category_id {}
    reason {}
    request_id {}
    cashed_out {false}
  end
  
end
