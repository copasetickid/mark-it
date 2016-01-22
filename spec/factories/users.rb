FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person-#{n}@example.com" }
    password "password"


    trait :with_bookmarks do
      after(:create) do |instance|
        create_list :bookmark, 2, user: instance
      end
    end
  end
end
