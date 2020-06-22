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
      avatar {fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'user.png'), 'image/png') }
    end
end
