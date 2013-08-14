FactoryGirl.define do
  factory :avatar do

    name "test"

    factory :random_avatar do
      name {Faker::Name.name}
    end
  end

end