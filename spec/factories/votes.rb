 FactoryGirl.define do
   val = rand(1) == 0 ? -1 : 1
   5.times do
    puts val
   end
   factory :vote do
    value val
    user
    post
   end
 end