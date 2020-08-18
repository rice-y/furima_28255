class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX, message: 'Input half_width characters' }
    validates :email, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/ }
    validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :last_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana.' }
    validates :first_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana.' }
    validates :birthday
  end
 end
