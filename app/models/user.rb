class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many:items
  has_many:purchases

  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    HALF_WIDTH = /\A\S+@\S+\.\S+\z/
    FULL_WIDTH = /\A[ぁ-んァ-ン一-龥]/
    KATAKANA =  /\A[ァ-ヶー－]+\z/
    validates :password, format: { with: PASSWORD_REGEX, message: 'Input half_width characters' }
    validates :email, uniqueness: true, format: { with: HALF_WIDTH }
    validates :nickname, format: { with: FULL_WIDTH , message: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: FULL_WIDTH , message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: FULL_WIDTH , message: 'is invalid. Input full-width characters.' }
    validates :last_katakana, format: { with: KATAKANA, message: 'is invalid. Input full-width katakana.' }
    validates :first_katakana, format: { with: KATAKANA, message: 'is invalid. Input full-width katakana.' }
    validates :birthday
  end
 end
