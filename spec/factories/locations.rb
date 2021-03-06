FactoryBot.define do
  factory :location do
    street { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
