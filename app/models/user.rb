class User < ActiveRecord::Base
  has_secure_password
  has_many :entries
  validates :username, presence:true, uniqueness: {message: "user name already exists"}
  validates :email, presence:true, uniqueness: {message: "email already registered"}
  validates :password, :length => {:within => 8..12, :wrong_length => "please input a password between 8-12 characters"}
end
