FactoryGirl.define do
  factory :comment do
    user
    photo
    body "This is a comment."
  end
end
