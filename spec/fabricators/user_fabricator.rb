Fabricator(:user) do
  email { sequence(:email) { |i| "#{Faker::Name.last_name}_#{i}@example.com" } }
  username { Faker::Internet.user_name }
  password "password"
end