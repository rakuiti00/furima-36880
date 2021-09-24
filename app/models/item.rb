class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :days_to_ship
  

  belongs_to :user
  has_one_attached :image

  # バリデーション
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true
  # validates :price, presence: true、inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  # ActiveHash バリデーション
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charges_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}

  #価格のバリデーション


end
