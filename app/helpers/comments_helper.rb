module CommentsHelper
  def format_comment(content)
    gfm(content)
  end
end
