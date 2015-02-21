def place_to_html_description(place)
    def format_entry(name, value)
      i18n_name = I18n.t("simple_form.labels.place.#{name}")
      displayed_value = (name == 'kind' ? I18n.t("kinds.codes.#{value}") : value)
      "<b>#{i18n_name} :</b> #{displayed_value}"
    end
    text_entries = place.attributes
        .slice('kind', 'street', 'zip_code', 'city', 'description', 'owner_name')
        .reject { |k, v| v.nil? }
        .map { |name, value| format_entry(name, value) }
    twitname = place.twitter_name
    twitter_entry = format_entry('twitter_name', "<a href='https://twitter.com/#{twitname}'>@#{twitname}</a>") unless !twitname
    url_entry = format_entry('url', "<a href='#{place.url}'>#{place.url}</a>") unless !place.url
    logo_img = "<img src='#{place.logo_url}' alt='#{place.name} logo'>" unless !place.logo_url
    direct_link = "<a href='/#/place/#{place.id}'>#{I18n.t 'feed.link_to_map_marker'}</a>"
    [
      logo_img,
      *text_entries,
      url_entry,
      twitter_entry,
      direct_link,
    ].compact.join '<br>'
end

atom_feed language: (I18n.locale == :fr ? 'fr-FR' : 'en-US') do |feed|
  feed.title I18n.t 'feed.title'
  feed.updated @places_items.first.updated_at unless @places_items.empty?
  @places_items.each do |place_item|
    feed.entry( place_item ) do |entry|
      entry.title place_item.name
      entry.content place_to_html_description(place_item), type: 'html'
      entry.author do |author|
        author.name place_item.owner_name
      end
    end
  end
end
