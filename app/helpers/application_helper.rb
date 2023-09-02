module ApplicationHelper
  def clink_to(title, link, css_class = nil)
    styled_title =
      css_class.nil? ? t(title) : raw("<i class=\"fa fa-fw #{css_class}\"></i>")
    link_to styled_title, link, title: t(title)
  end

  def cdlink_to(title, link, icon = 'fa-remove', confirm_text = 'control.are_you_sure')
    link_to icon.blank? ? t(title) : content_tag(:i, '', class: %i[fa fa-fw].push(icon)),
            link,
            title: t(title),
            method: :delete, data: { confirm: strip_tags(t(confirm_text)) }
  end

  def active_check(active)
    status_class = active ? 'true fa-check' : 'false fa-remove'
    "<i class=\"fa fa-fw active-check-#{status_class}\"></i>".html_safe
  end
end
