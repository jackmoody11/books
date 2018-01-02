module ApplicationHelper
  def gravatar_for(user, options = {size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end

  def small_gravatar_for(user, options={size: 40})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "avatar img-raised img-circle")
  end
  # Name existence helpers
  def show_first_name(listing)
    if listing.user.first_name
      listing.user.first_name
    end
  end

  def show_last_name(listing)
    if listing.user.last_name
      listing.user.last_name
    end
  end

  def show_full_name(listing)
    if listing.user.first_name && listing.user.last_name
      listing.user.first_name + ' ' + listing.user.last_name
    end
  end

  # Author existence

  def show_author(listing)
    if listing.author
      truncate(listing.author, length: 25)
    end
  end

end
