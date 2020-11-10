FactoryBot.define do
  factory :user do
    email { "abc#{rand(10..1000)}@gmail.com" }
    password  { "password" }
  end
end
