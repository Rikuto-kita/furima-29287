class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         with_options presence: true do
          validates :nickname,  length:{ maximum: 40 }
          FAMILY_NAME = validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
          FIRST_NAME = validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
          FAMILY_NAME_KANA = validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
          FIRST_NAME_KANA =validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
          validates :birthday
          validates :password,format: {with:/\A[a-z\d]{6,}+\z/i}
          validates :email,format: {with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
        end
end