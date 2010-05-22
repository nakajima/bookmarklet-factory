# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(name)
    content_for(:title) { h(name) }
  end
end
