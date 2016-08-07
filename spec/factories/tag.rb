FactoryGirl.define do
  factory :tag, :class => 'Tag' do
    name { Faker::Name.title }
    # association :bookmark, factory: :bookmark
  end  
end