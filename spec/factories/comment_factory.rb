FactoryGirl.define do
  sequence(:body) { |n| "This is comment number#{n}" }

  factory :comment do
    body
    rating 3
    user
    product
  end
end
