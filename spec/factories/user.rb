FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    username {first_name}
    email Faker::Internet.email
    password Faker::Internet.password

    factory :admin do
      username {"#{first_name}_admin"}
      admin true
    end


  end

end