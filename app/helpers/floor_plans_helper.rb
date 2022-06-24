module FloorPlansHelper
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

  def format_price(price)
    number_to_currency(price, precision: 0)
  end

  def formatted_highest_price(price_history)
    sorted_price_history = price_history.sort_by(&:price)

    high = sorted_price_history.last
    "High - #{format_price(high.price)}"
  end

  def formatted_lowest_price(price_history)
    sorted_price_history = price_history.sort_by(&:price)

    low = sorted_price_history.first
    "Low - #{format_price(low.price)}"
  end
end
