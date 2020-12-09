FactoryBot.define do
  factory :user do
    # name {Faker::Name.last_name}
    # name {Faker::Name.first_name}
    # email {Faker::Internet.free_email}
    # password {Faker::Internet.password(min_length: 6)}
    # password_confirmation {password}
    # first_name { person.first.kanji }
    # last_name { person.last.kanji }
    # first_name_kana { person.first.katakana }
    # last_name_kana { person.last.katakana }

    name                  { 'furima太郎' }
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