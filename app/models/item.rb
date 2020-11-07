class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true    
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  validates :prefecture_id, presence: true, numericality: { other_than: 0 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user, optional: true
  validates :category_id, presence: true, numericality: { other_than: 0 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to :user, optional: true
  validates :condition_id, presence: true, numericality: { other_than: 0 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postage_payer
  belongs_to :user, optional: true
  validates :postage_payer_id, presence: true, numericality: { other_than: 0 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :handling_time
  belongs_to :user, optional: true
  validates :handling_time_id, presence: true, numericality: { other_than: 0 } 

end
