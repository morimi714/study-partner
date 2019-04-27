class Teacher < ApplicationRecord
  has_secure_password
  # nameカラムに関するバリデーションを作成してください
  validates :name, {presence:true}
  # emailカラムに関するバリデーションを作成してください
  validates :email, {presence:true, uniqueness: true}
  validates :password, {presence: true}
  
end
