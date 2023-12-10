FactoryBot.define do
  factory :weekly_contributor do
    week_start { Time.now.beginning_of_week }
    contributor { 'test_contributor' }
    points { 10 }
  end
end