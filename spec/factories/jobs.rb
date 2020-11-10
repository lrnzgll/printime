FactoryBot.define do
  factory :job do
    title { "Spiderman#{rand(50..5000)}" }
    user
  end
end
