FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  
  factory :user do
    email
    password "cookies"
    first_name "Fred"
    last_name "Smith"
    admin false
  end

  factory :admin, class: User do
    email
    password "flowers"
    first_name "George"
    last_name "Jones"
    admin true
  end

end
