def create_time_ago(timestamp)
  now = Time.now
  d = DateTime.parse("#{now - timestamp}")

  if d.hour >= 24
    return "#{d.hour / 24} day(s) ago"
  elsif d.hour >= 1
    return "#{d.hour} hour(s) ago"
  elsif d.min >= 1
    return "#{d.min} minute(s) ago"
  else
    return "#{d.sec} second(s) ago"
  end
end

def params_has_blank?(params)
  params.values.any? &:empty?
end

def find_upvotes(post, user_id)
  if post.post_votes.any? { |vote| vote.user_id == user_id }
    return '<img class="arrow" src="/orange_arrow.png">'
  else
    return '<img class="arrow" src="/black_arrow.png">'
  end
end

def current_user
  @current_user ||= User.find_by_id(session[:id])
end
