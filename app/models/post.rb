class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :post_votes

  def username
    user = User.find(user_id)
    user.username
  end

end
