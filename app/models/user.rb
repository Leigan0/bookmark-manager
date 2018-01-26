require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email_address, String
  property :password_hash, Text
  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end