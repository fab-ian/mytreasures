FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    name 'Igor Wspaniały'
    password '123456'
    email { generate :email }
    locale 'pl'
  end
end
