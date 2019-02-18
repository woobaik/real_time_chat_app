module ApplicationHelper
  
  def flash_class(level)
    case level
    when "success" then "ui positive message"
    when "error" then "ui red message"
    when "notice" then "ui blue message"
    else
      "nothing matched"
    end
  end
end
