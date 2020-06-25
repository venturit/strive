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
      avatar {fixture_file_upload(Rails.root.join('features', 'fixtures', 'files', 'user.png'), 'image/png') }
    end
  end

FactoryBot.define do
      factory :badge do
        name {'Bronze'}
        reward {5.00}
        notes {'Reward value worth $5.00'}
        emblem {fixture_file_upload(Rails.root.join('features', 'fixtures', 'files', 'bronze.png'), 'image/png') }
      end
  end