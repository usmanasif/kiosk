module ApplicationHelper
  def active_controller?(controller_name)
    params[:controller] == controller_name
  end

  def static_pages_controller?
    active_controller?('static_pages')
  end
end
