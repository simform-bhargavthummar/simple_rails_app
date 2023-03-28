module ApplicationHelper
  def display_errors(model)
    if model.errors.any?
      content_tag(:div, class: "alert alert-danger") do
        concat(content_tag(:ul) do
          model.errors.full_messages.each do |msg|
            concat content_tag(:li, msg)
          end
        end)
      end
    end
  end
  
  def order_statuses
    Order.statuses.keys
  end
end
