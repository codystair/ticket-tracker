class User < ApplicationRecord
  has_secure_password validations: false

  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}
end
