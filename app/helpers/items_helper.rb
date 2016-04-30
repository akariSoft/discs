module ItemsHelper
  def info_for(item)
    info = []
    genre = []
    lang = []
    
    item.genres.each do |g|
      genre << g.name
    end
    
    item.languages.each do |l|
      lang << l.name
    end
    
    genre = genre.join(', ')
    lang = lang.join(', ')
    
    info << "<p><strong>#{t 'attributes.alt_title'}:</strong> #{item.alt_title}</p>" unless item.alt_title.nil? or item.alt_title.empty?
    info << "<p><strong>#{t 'attributes.genre'}:</strong> #{genre}</p>" unless genre.empty?
    info << "<p><strong>#{t 'attributes.info'}:</strong> #{item.info}</p>" unless item.info.nil? or item.info.empty?
    info << "<p><strong>#{t 'attributes.lang'}:</strong> #{lang}</p>" unless lang.empty?
    info << "<p><strong>#{t 'attributes.episodes'}:</strong> #{item.episodes}</p>" unless item.episodes.nil? or item.episodes.empty?
    info << "<p><strong>#{t 'attributes.discs'}:</strong> #{item.discs}</p>" unless item.discs.nil?
    info << "<p><strong>#{t 'attributes.details'}:</strong> #{item.details}</p>" unless item.details.nil? or item.details.empty?
    
    info.join("\n").html_safe
  end
end
