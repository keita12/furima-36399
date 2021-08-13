FactoryBot.define do
  factory :item do
		item_name               {'a'}
		description             {'a'}
		category_id             {2}
		condition_id            {2}
		delivery_fee_id         {2}
		area_id                 {2}
		shipping_day_id         {2}
		price                   {'300'}

		after(:build) do |item|
      item.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.jpg')
    end
	end
end