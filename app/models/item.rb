class Item < ApplicationRecord
  has_many :comments
  belongs_to :user, optional: true
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { other_than: 0, message: "Half-width number" }, format: { with: /\A[0-9]+\z/ }
    validates :price, format: { with: /\A[3-9][0-9]{2}|[1-9][0-9]{3,6}\z/, message: "Out of setting range" }
    validates :image
  end

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :postage_payer
    belongs_to_active_hash :handling_time
    with_options presence: true, numericality: { other_than: 0 } do
      validates :prefecture_id
      validates :category_id 
      validates :condition_id 
      validates :postage_payer_id 
      validates :handling_time_id 
    end

end
