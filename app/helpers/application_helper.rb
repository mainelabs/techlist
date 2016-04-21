module ApplicationHelper
  def markdown(markdown_text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    @markdown.render(markdown_text).html_safe if markdown_text
  end

  def map_link_to(place)
    link_to place.human_address, "http://www.google.com/maps/place/#{place.latitude},#{place.longitude}", target: '_blank'
  end
end
