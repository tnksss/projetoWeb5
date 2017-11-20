FactoryGirl.define do
  factory :contact do
    name "Dudy"
    sequence :email { |n| "tcc#{n}@tsi.gp.utfpr.edu.br" }
    message "Hello"
  end
end