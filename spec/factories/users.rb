FactoryGirl.define do
  factory :user do
    sequence :email { |n| "user#{n}@bucketlist.br" }
    password 'password'
    password_confirmation 'password'
  end
end
