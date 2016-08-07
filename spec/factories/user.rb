FactoryGirl.define do
  factory :user, :class => 'User' do
    email { Faker::Internet.email }
    password '123456789'
    admin false
  end

  factory :admin, parent: :user, class: "User" do
    admin true
  end
end