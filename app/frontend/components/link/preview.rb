# frozen_string_literal: true

# @logical_path components/link
class Link::Preview < ViewComponent::Preview
  # @!group Variants
  def button
    render_with_template(
      template: "link/buttons_template",
    )
  end

  def chip
    render_with_template(
      template: "link/chips_template",
    )
  end

  def icon
    render_with_template(
      template: "link/icons_template",
    )
  end
  # @!endgroup
end
