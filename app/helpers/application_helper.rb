module ApplicationHelper
  def listing_status_indicator(floor_plan)
    status_classes = %w[flex flex-col h-100 rounded-sm mr-4 w-2]

    case floor_plan.listing_status
    when :unavailable
      status_classes.push('bg-red-400')
    when :new
      status_classes.push('bg-green-400')
    else
      status_classes.push('bg-blue-400')
    end

    content_tag('div', '', class: status_classes.join(' '))
  end
end
