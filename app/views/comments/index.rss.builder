xml.rss :version => "2.0" do
xml.channel do
  xml.title "Feed de Comentaris"
  xml.description "Feed dels comentaris del podcast Semàntic"  
  xml.language 'ca'
  xml.link root_url
  for comment in @comments
          xml.item do
            xml.title "Comentari ##{comment.id} a l'episodi ##{comment.episode.number}, escrit per #{comment.name}"
            xml.pubDate comment.created_at.to_s(:rfc822)
            xml.description gfm(comment.content)
            xml.link "#{episode_url(comment.episode)}#comment_#{comment.id}"
          end
     end
   end
end
