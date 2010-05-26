number = 0
xml.rss :version => "2.0" do
xml.channel do
  xml.title "Feed de Comentaris"
  xml.description "Feed dels comentaris del podcast Semàntic"  
  xml.language 'ca'
  xml.link root_url
  for comment in @comentaris
        number = number + 1
          xml.item do
            xml.title "Comentari ##{number}"
            xml.category "Episodi #{comment.episode.title}"              
            xml.pubDate comment.created_at.to_s(:rfc822)                      
            xml.author "#{comment.name}@semantic.cat"
            xml.description comment.content
            xml.link episode_url(comment.episode)           
          end
     end
   end
end
