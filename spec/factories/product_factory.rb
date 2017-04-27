FactoryGirl.define do
  sequence(:name) { |n| "Sample Product #{n}"}
  sequence(:description) { |n| "Sample description of yummy sample cookie #{n}"}

  factory :product do
    name
    description
    image_url "sport-green-bike.jpg"
    colour "red"
    price_in_cents "1595"
  end
end
