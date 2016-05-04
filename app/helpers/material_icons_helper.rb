module MaterialIconsHelper
  def material_icon(identifier)
    "<i class=\"material-icons\">#{identifier}</i>".html_safe
  end
end
