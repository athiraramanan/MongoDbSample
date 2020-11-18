# FactoryBot.define do
#   service_array = ["Test Service", "Test Service Two"]
#   letter = ["a", "b", "c", "d"]
# factory :user, class: Question do
#     question { Faker::Lorem.question }
#     answer { Faker::Lorem.sentence }
#     service { service_array.sample }
#     number { Faker::Number.between(1, 2) }
#     letter { letter.sample }
#   end
# end
# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 1 }
    firstName { 'Athira' }
    lastName { 'R' }
  end
end

