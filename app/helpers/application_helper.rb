module ApplicationHelper
  def markdown(markdown_text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    @markdown.render(markdown_text).html_safe if markdown_text
  end
end
