class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_secure_password
    validates :password, length: { minimum: 4, message: "A senha deve ter no mínimo 4 dígitos" }
  end