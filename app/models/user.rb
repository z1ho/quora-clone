require 'bcrypt'

class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  attr_accessor :password
  include BCrypt

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

  def log_in(password)
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
