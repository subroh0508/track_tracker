# frozen_string_literal: true

# @logical_path components
class Button::Preview < ViewComponent::Preview
  # @!group Variants
  def text
    render Button::Component.new(
      variant: Button::TEXT,
    ) do
      "Text"
    end
  end

  def contained
    render Button::Component.new(
      variant: Button::CONTAINED,
    ) do
      "Contained"
    end
  end

  def outlined
    render Button::Component.new(
      variant: Button::OUTLINED,
    ) do
      "Outlined"
    end
  end
  # @!endgroup
end
