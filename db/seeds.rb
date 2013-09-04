30.times do 
  User.create :username => Faker::Name.first_name.downcase,
              :password => "12345"
end

user_ids = 1.upto(30).map { |num| num }

100.times do 
  Post.create :user_id => user_ids.sample,
                    :title => Faker::Lorem.sentence,
                    :url => Faker::Internet.url
end


post_ids = 1.upto(100).map { |num| num }

100.times do
  Comment.create :user_id => user_ids.sample,
                 :post_id => post_ids.sample,
                 :text => Faker::Lorem.paragraph
end
