require 'bcrypt'

class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  include BCrypt
  
  has_many :rounds
  has_and_belongs_to_many :decks

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
