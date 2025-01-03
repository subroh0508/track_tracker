# frozen_string_literal: true

# @logical_path components
class Button::Preview < ViewComponent::Preview
  # @!group Variants
  def text
    render_with_template(
      template: "button/text_template",
    )
  end

  def contained
    render_with_template(
      template: "button/contained_template",
    )
  end

  def outlined
    render_with_template(
      template: "button/outlined_template",
    )
  end
  # @!endgroup
end
