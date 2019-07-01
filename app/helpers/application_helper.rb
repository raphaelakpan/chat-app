module ApplicationHelper
  def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def flash_class(level)
    case level.to_sym
    when :notice then "alert-info"
    when :success then "alert-success"
    when :error then "alert-danger"
    end
  end
end
