module DeviseHelper

  def devise_error_messages!
    if resource.errors.any?
      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
      count = pluralize(resource.errors.count, "error")
      html = <<-HTML
      <div class="alert alert-danger">
        The form contains #{count}:
        #{messages}
      </div>
      HTML
      
      html.html_safe
    end
  end

end
