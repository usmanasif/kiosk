module ApplicationHelper
  def active_controller?(controller_name)
    params[:controller] == controller_name
  end

  def static_pages_controller?
    active_controller?('static_pages')
  end

  def employees_controller?
    active_controller?('employees')
  end

  def flash_class(level)
    case level.to_sym
      when :notice then 'success'
      when :success then 'success'
      when :error then 'error'
      when :alert then 'error'
    end
  end
end
