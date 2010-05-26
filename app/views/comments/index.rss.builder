number = 0
xml.instruct!
xml.channel do
  xml.title "Feed de Comentaris"
  xml.description "Feed dels comentaris del podcast Semàntic"  
  for comment in @comentaris
        number = number + 1
          xml.item do
            xml.titol "Comentari ##{number}"
            xml.published_at comment.created_at.to_s(:rfc822)            
            xml.episodi "Episodi #{comment.episode.title}"            
            xml.autor "Autor: #{comment.name}"         
            xml.content comment.content
          end
     end
end
