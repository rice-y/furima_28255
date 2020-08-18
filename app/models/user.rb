class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  with_options presence: true do
      PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/
      validates :password, length: { minimum:6 }, format: {with: PASSWORD_REGEX, message: 'Input '}
      validates :email, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/ }
      validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
      validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input half-width characters."}
      validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input half-width characters."}
      validates :last_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input half-width characters."}
      validates :first_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input half-width characters."}
      # validates :birthday, format: { with:/\A[0-9]+\z/ , message: "is invalid. Input half-width characters."}

  end

 end
