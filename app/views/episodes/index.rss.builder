title = "Semàntic"
author = "Bernat Farrero i Jordi Romero"
description = "TODO"
keywords = "TODO"

image = "http://semantic.cat/images/semantic_podcast.jpg"
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
    xml.itunes :keywords, keywords
    xml.itunes :explicit, 'clean'
    xml.itunes :image, :href => image
    xml.itunes :owner do
      xml.itunes :name, author
      xml.itunes :email, 'podcast@semantic.cat'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, :text => 'Technology' do
      xml.itunes :category, :text => 'Software How-To'
    end
    xml.itunes :category, :text => 'Education' do
      xml.itunes :category, :text => 'Training'
    end
    
    @episodes.each do  |episode|
      # download = episode.attachment
      download = true
      if download
        xml.item do
          xml.title "Capítol #{episode.id}: #{episode.title}"
          xml.description episode.description
          xml.pubDate episode.aired_on.to_s(:rfc822)
          # xml.enclosure :url => download.url, :length => download.bytes, :type => 'video/quicktime'
          xml.link episode_url(episode)
          xml.guid({:isPermaLink => "false"}, episode.permalink)
          xml.itunes :author, author
          xml.itunes :subtitle, truncate(episode.description, :length => 150)
          xml.itunes :summary, episode.description
          xml.itunes :explicit, 'no'
          # xml.itunes :duration, episode.duration
        end
      end
    end
  end
end
