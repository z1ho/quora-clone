require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :password
  include BCrypt

 # validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
 #validates :password, :format => {:with => /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/, message: "Password must contain at least 6 characters and include one number and one letter."}

  has_many :questions
  has_many :answers

  def password
    @password ||= Password.new(encrypted_password) #if @password is empty, it will create a new one
  end                                              #else it will take the encrypted password

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

  def create
    self.encrypted_password = Password.create(password)
  end

  def login(password)
    if self.password == password
      return true
    else
      return false  
    end
  end
end

#########

# def self.authenticate(username="@username", password="@password")
#   if  EMAIL_REGEX.match(username_or_email)    
#     user = User.find_by(username)
#   else
#     user = User.find_by(username)
#   end
#   if user && user.match_password(password)
#     return user
#   else
#     return false
#   end
# end   
# def match_password(password="password")
#   encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
