module ApplicationHelper
  def pretty_format_datetime(datetime)
    datetime.in_time_zone('Eastern Time (US & Canada)').strftime('%m/%d/%Y %l:%M %P')
  end
end
