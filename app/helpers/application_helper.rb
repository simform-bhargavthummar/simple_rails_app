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

  def custom_error(model,field)
    error_messages = model.errors.full_messages_for(field)
    unless error_messages.empty?
      error_messages.each do |message|
        puts "<div class='alert alert-danger'>#{message}</div>"
      end
    end
  end

  def order_statuses
    Order.statuses.keys
  end

  def product_statuses
    QueryProduct.statuses.keys
  end
end
