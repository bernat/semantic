module CommentsHelper
  def comments_display(_comments)
     html = content_tag(:div,
     _comments.blank? ? "Cap comentari de moment" : render(:partial => _comments),
     :class => "comments")
   end

   def new_comment_link
     link_to 'Escriu un nou comentari', new_episode_comment_path(), :class => "get"
   end
end
