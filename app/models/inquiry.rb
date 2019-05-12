class Inquiry < ApplicationRecord
  include ActiveModel::Model
  
  attr_accessor :body
  
  belongs_to :teacher
  belongs_to :user
end
