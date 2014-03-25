require 'bcrypt'
class User < ActiveRecord::Base

  # Allow us to hold a plain-text password in memory
  attr_accessor :password

  def authenticated? pwd
  	self.hashed_password == BCrypt::Engine.hash_secret(pwd, self.salt)
  end

  before_save :hash_stuff

  def authenticated?(pwd)
    self.hashed_password == BCrypt::Engine.hash_secret(pwd, self.salt)
  end

  private
  #hash the password
  def hash_stuff
    self.username_lower = username.downcase
    #generate salt
    self.salt = BCrypt::Engine.generate_salt
    #hash it
    self.hashed_password = BCrypt::Engine.hash_secret(password, self.salt)
    #get rid of the actual password, so set it to nil
    self.password = nil
  end

end
