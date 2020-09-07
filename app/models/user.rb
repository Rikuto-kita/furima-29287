class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         with_options presence: true do
          validates :nickname,  length:{ maximum: 40 }
          validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
          validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
          validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
          validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
          validates :birthday
          validates :password,format: {with:/\A[a-z\d]{6,}+\z/i}
          validates :email,format: {with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
        end
end
