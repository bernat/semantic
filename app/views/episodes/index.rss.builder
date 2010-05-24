title = "Semàntic"
subtitle = "Podcast d'informàtica en català"
author = "Semàntic"
description = "Podcast d'informàtica en català"
keywords = "informàtica, podcast, català, enginyeria en informàtica, programació, internet, tecnología"

image = request.protocol + request.host_with_port + "/images/semanticlogo.jpg"
format = 'mov'


xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/",  :version => "2.0" do
  xml.channel do 
    xml.title title
    xml.link 'http://semantic.cat'
    xml.description description
    xml.language 'ca'
    xml.pubDate @episodes.first.aired_on.to_s(:rfc822)
    xml.lastBuildDate @episodes.first.aired_on.to_s(:rfc822)
    xml.itunes :author, author
    xml.itunes :subtitle, subtitle
    xml.itunes :keywords, keywords
    xml.itunes :summary, description
    xml.itunes :explicit, 'clean'
    xml.itunes :image, :href => image
    xml.itunes :owner do
      xml.itunes :name, author
      xml.itunes :email, 'podcast@semantic.cat'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, :text => 'Technology' do
      xml.itunes :category, :text => 'Tech News'
    end
    xml.itunes :category, :text => 'Technology' do
      xml.itunes :category, :text => 'Software How-To'
    end
    
    @episodes.each do  |episode|
      if episode.asset?
        download = episode.asset
        xml.item do
          xml.title "Capítol #{episode.number}: #{episode.title}"
          xml.description episode.description
          xml.pubDate episode.aired_on.to_s(:rfc822)
          xml.enclosure :url => download.url, :length => download.size, :type => 'audio/mpeg'
          xml.link episode_url(episode)
          xml.guid(episode_url(episode))
          xml.itunes :author, author
          xml.itunes :subtitle, truncate(episode.description, :length => 150)
          xml.itunes :summary, episode.description
          xml.itunes :explicit, 'no'
          xml.itunes :duration, episode.duration
        end
      end
    end
  end
end
