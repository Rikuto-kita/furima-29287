FactoryBot.define do
  factory :user do
    nickname { 'abe' }
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { password }
    family_name { '北' }
    first_name { '颯人' }
    family_name_kana { 'キタ' }
    first_name_kana { 'リクト' }
    birthday { '2000-02-03' }
  end
end
