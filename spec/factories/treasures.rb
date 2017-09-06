FactoryGirl.define do
  factory :treasure do
    name 'Treasure name'
    description 'Treasure description'
    photo { File.new("#{Rails.root}/spec/support/fixtures/alina_glowka.jpg") }
    warehouse
    user
  end
end
