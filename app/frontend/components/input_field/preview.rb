# frozen_string_literal: true

# @logical_path components
class InputField::Preview < ViewComponent::Preview
  def default
    render InputField::Component.new(
      items: [
        InputField::Item.new(
          id: "email",
          label: "Email",
          type: "email",
          placeholder: "name@example.com",
          required: true,
        ),
        InputField::Item.new(
          id: "name",
          label: "Name",
          type: "text",
          placeholder: nil,
          required: nil,
        ),
      ],
      button_label: "Submit",
      classes: "max-w-sm mx-auto",
    )
  end
end
