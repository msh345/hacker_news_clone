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
