FactoryGirl.define do
  factory :bookmark, :class => 'Bookmark' do
    content { Faker::Internet.url }
    description { Faker::Lorem.paragraph }
    association :user, factory: :user

    after(:build) do |bookmark|
      bookmark.tags << FactoryGirl.create(:tag)
    end
  end
end