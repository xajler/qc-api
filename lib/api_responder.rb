class ApiResponder < ActionController::Responder
  def to_format
    case
    when has_errors?
      controller.response.status = :unprocessable_entity
      display_errors
    when post?
      controller.response.status = :created
       default_render
  end

  rescue ActionView::MissingTemplate => e
    api_behavior(e)
  end
end
