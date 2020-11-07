class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
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
