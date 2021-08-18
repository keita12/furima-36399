class RecordShippingInformation
	include ActiveModel::Model
	attr_accessor :telephone_num,:postal_code,:area_id,:municipalities,:address,:building_name,:record,:user_id,:item_id,:token

	with_options presence: true do
		validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
		# validates :postal_code, format: {with:/^[a-zA-Z]+$/}
		validates :telephone_num, format: {with: /\A\d{10,11}\z/}
		validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
		validates :address, :municipalities
		validates :item_id,:user_id,:token
	end
	def save
		record = Record.create(user_id: user_id, item_id: item_id)

		ShippingInformation.create(telephone_num: telephone_num,postal_code: postal_code,area_id: area_id,municipalities: municipalities,address: address,building_name: building_name,record: record)
	end
end