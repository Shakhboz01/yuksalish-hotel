module ApplicationHelper
  def clink_to(title, link, css_class = nil)
    styled_title =
      css_class.nil? ? t(title) : raw("<i class=\"fa fa-fw #{css_class}\"></i>")
    link_to styled_title, link, title: title
  end

  def cdlink_to(title, link, icon = 'fa-remove', confirm_text = 'вы уверены?')
    link_to icon.blank? ? title : content_tag(:i, '', class: %i[fa fa-fw].push(icon)),
            link,
            title: title,
            method: :delete, data: { confirm: strip_tags(confirm_text) }
  end

  def active_check(active)
    status_class = active ? 'true fa-check' : 'false fa-remove'
    "<i class=\"fa fa-fw active-check-#{status_class}\"></i>".html_safe
  end

  def num_to_usd(price)
    number_to_currency(price, unit: '')
  end
end
