module ApplicationHelper
  def flash_class(level)
    case level
      when :error then "alert alert-error"
      when :notice then "alert alert-info"
      when :alert then "alert alert-error"
    end
  end
end
