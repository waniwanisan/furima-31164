class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/, message: "Include both letters and numbers" }
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "has already been taken" }
    validates :nickname
    validates :last_name, format: { with: /\A[一-龥ぁ-ん]/, message: "Full-width characters"}
    validates :first_name, format: { with: /\A[一-龥ぁ-ん]/, message: "Full-width characters"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :birth_date
  end
end
