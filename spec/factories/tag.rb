FactoryGirl.define do
  factory :tag, :class => 'Tag' do
    name { Faker::Name.title }
  end  
end
