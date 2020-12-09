FactoryBot.define do
  factory :user do

name                      { 'furima太郎' }
    email                 { 'test@example' }
    password              { '1234abc' }
    password_confirmation { '1234abc' }
    birth_day             { Faker::Date.birthday }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ヤマダ' }

  end
end
