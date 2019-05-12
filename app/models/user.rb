class User < ApplicationRecord
 has_secure_password
  validates :name, {presence:true}
  validates :email, {presence:true, uniqueness: true}
  validates :password, {presence: true}
  
 has_many :inquiry
end
