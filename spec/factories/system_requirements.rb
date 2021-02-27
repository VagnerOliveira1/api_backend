FactoryBot.define do
  factory :system_requirement do
    sequence(:name) { |n| "BasicSystem #{n}" }
    operational_system { Faker::Computer.os }
    storage { "120GB" }
    processor { "DualCore" }
    memory { "4GB" }
    video_board { "NVIDEA" }
  end
end
