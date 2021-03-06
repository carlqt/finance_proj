module FormsHelper
  def filter_pills(title, count = nil)
    content_tag :a, title, class: "btn-primary btn", type: "button", href: send("#{controller_name}_path", status: title.downcase) do
      "#{title} ".html_safe + content_tag(:span, count, class: "badge")
    end
  end
end
