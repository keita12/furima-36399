class Item < ApplicationRecord
	has_one_attached :image
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
	belongs_to :area
	belongs_to :condition
	belongs_to :delivery_fee
	belongs_to :shipping_day
	belongs_to :user

	validates :item_name, :description, :price, :image, presence: true
	validates :category_id, :area_id, :condition_id, :delivery_fee_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
	validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
	validates :price, format: {with: /\A[0-9]+\z/i, message: "is invalid. Input full-width characters."}
end
