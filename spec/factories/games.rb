FactoryBot.define do
  factory :game do
    mode { %i( pvp pve both).sample }
    release_date { Faker::Date.between(from: '2017-09-23', to: '2020-09-25') }
    developer { Faker::Company.name }
    system_requirement
  end
end
