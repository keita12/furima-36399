FactoryBot.define do
  factory :user do
		nickname               {'ケイタ'}
		email                  {Faker::Internet.free_email}
		password               {'keita323'}
		password_confirmation  {password}
		first_name             {'啓太'}
		last_name              {'稲森'}
		katakana_first_name    {'ケイタ'}
		katakana_last_name     {'イナモリ'}
		birthday               {'1933-03-04'}
	 end
	end
