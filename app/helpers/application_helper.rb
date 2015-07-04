module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render('/shared/items', f: builder)
    end

    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.with_indifferent_access[flash_type] || flash_type.to_s
  end
 
  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end

  def multidropdown(title, options={}, &block)
    content_tag :li, class: "dropdown-submenu" do
      content = link_to '#', class: "has-submenu" do
        title.html_safe + content_tag(:div, nil, class: "caret")
      end

      content += content_tag :ul, class: "dropdown-menu" do
        block.call
      end
    end
  end
end
