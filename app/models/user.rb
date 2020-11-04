class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/, message: "Include both letters and numbers" }
  validates :email, uniqueness: true
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: "Full-width characters"}
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: "Full-width characters"}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  validates :birth_date, presence: true

end
