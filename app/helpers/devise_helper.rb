module DeviseHelper

  def devise_error_messages!
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    count = pluralize(resource.errors.count, "error")
    html = <<-HTML
    <div class="alert alert-danger">
      The form contains #{count}:
      #{messages}
    </div>
    HTML
    html.html_safe if resource.errors.any?
  end
end
