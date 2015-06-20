module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render('/shared/items', f: builder)
    end

    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def displayed_column_names(object)
    if object.is_a? WithPo
      ["Letter Code", "Requestor","Company Name","Supplier","Engineer","Requestor","Payment Type","Total Amount","Status","Action"]
    elsif object.is_a? WithoutPo
      ["Letter Code", "Requestor","Company Name","Supplier","Transaction Number","Requestor","Payment Type","Total Amount","Status","Action"]
    end
  end
end
