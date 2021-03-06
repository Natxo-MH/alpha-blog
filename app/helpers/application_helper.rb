module ApplicationHelper
  
  def gravatar_for(user, options = {size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle") # "img-circle" hace referencia a Bootstrap. 
                                                                     # Así pues es el tener instalado éste último quien permite esta classe
  end

end
