require 'faker'

# create 10 random users
10.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    access_enabled: Faker::Boolean.boolean,
    initial_access: Faker::Time.backward(days: 30),
    last_access: Faker::Time.between(from: 30.days.ago, to: Time.now),
    average_minutes_used_last_30_days: Faker::Number.between(from: 0, to: 100),
    fees_last_30_days: Faker::Number.decimal(l_digits: 2),
    user_type: %w[director producer talent].sample
  )
  puts "Created user #{user.id}: #{user.name}"
end