class OrderForm

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :block, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :building_name
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    
    Address.create(purchase_id: purchase.id,post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number)
    
     
  end


end