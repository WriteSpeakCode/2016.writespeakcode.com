module CommonHelper
  def link_or_text(name, link='', classes='')
    str = ""
    str = name if there?(name)

    if there?(link)
      lnk = "<a href=#{link}"
      lnk = lnk + " class='#{classes}'" if there?(classes)
      str = lnk + ">#{str}</a>"
    elsif there?(str) && there?(classes)
      str = "<span class='#{classes}'>#{str}</span>"
    end

    str
  end

  def there?(item)
    !(item.nil? || item.empty?)
  end
end
