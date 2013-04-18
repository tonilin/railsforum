module BreadcrumbHelper



  def set_breadcrumbs
    @breadcrumbs ||= [link_to("Home", '/')]

  end

  def add_breadcrumbs(title = nil, url = nil)

    if title && url
      set_breadcrumbs << link_to(title, url)
    elsif title
      set_breadcrumbs << "#{title}"
    end

  end


  def render_breadcrumbs
    set_breadcrumbs if !@breadcrumbs

    str = "".html_safe

    @breadcrumbs.each_with_index do |c , i|

      if i == @breadcrumbs.length - 1
        str +=  content_tag(:li, c, :class => "active")
      else
        str +=  content_tag(:li, c + content_tag(:span, '/', :class => "divider"))
      end

    end


    content_tag(:ul, str, :class => "breadcrumb")

  end



end
