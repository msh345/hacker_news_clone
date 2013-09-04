class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates_uniqueness_of :username

  include BCrypt

  def password
    @password = Password.new(self.password_digest)
  end

  def password=(secret)
    @password = Password.create(secret)
    self.password_digest = @password
  end

end
