FactoryGirl.define do

  sequence :surname do |n|
    "Doe#{n}"
  end

  factory :author do
    surname 'Simpson'
  end
end