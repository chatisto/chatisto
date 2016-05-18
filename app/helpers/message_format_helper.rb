module MessageFormatHelper
  include ActionView::Helpers::AssetUrlHelper

  def format_message(content, links: true)
    html_escaped = ERB::Util.html_escape(content).to_s
    html_escaped.gsub!(/:([\w+-]+):/) do |colon_emoji|
      if emoji = Emoji.find_by_alias(colon_emoji[1..-2])
        %(<img alt="#{colon_emoji}" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="18" height="18" title="#{colon_emoji}">)
      else
        colon_emoji
      end
    end
    html_escaped.gsub!(URI.regexp(["http", "https"])) do |url|
      %{<a href="#{url}" target="_blank">#{url}</a>}
    end if links
    html_escaped.html_safe if content.present?
  end
end
