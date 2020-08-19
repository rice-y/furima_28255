class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :lead_time

  belongs_to:user
  has_one_attached :image


  validates :image, :name, :description, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :ship_from_id, :lead_time_id,   numericality: { other_than: 1 }
  validates :price,  numericality:  {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } 
end
