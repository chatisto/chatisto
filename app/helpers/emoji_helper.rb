module EmojiHelper
  include ActionView::Helpers::AssetUrlHelper

  def emojify(content)
    ERB::Util.html_escape(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="18" height="18">)
      else
        match
      end
    end.html_safe if content.present?
  end
end
