module ApplicationHelper
  def flash_class(level)
    case level.to_s
    when 'notice' then 'info'
    when 'success' then 'success'
    when 'error' then 'danger'
    when 'alert' then 'warning'
    else 'dark'
    end
  end
end