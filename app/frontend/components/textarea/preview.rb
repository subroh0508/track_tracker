# frozen_string_literal: true

# @logical_path components
class Textarea::Preview < ViewComponent::Preview
  # @param placeholder text
  def plain(
    placeholder: "Input anything..."
  )
    render Textarea::Component.new(
      placeholder: placeholder,
    )
  end

  # @param placeholder text
  def disabled(
    placeholder: "Input anything..."
  )
    render Textarea::Component.new(
      placeholder: placeholder,
      disabled: true,
    )
  end
end
