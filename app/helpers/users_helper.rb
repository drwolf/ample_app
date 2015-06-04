module UsersHelper
 # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 142 } )    
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]       
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"   
    image_tag(gravatar_url, size: size, alt: user.name, class: "gravatar")   
  end 
end

#?d=http%3A%2F%2Fexample.com%2Fimages%2Favatar.jpg


