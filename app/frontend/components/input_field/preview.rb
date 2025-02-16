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
          icon_class: Icon::Envelope,
          placeholder: "name@example.com",
          required: true,
        ),
        InputField::Item.new(
          id: "name",
          label: "Name",
          type: "text",
          icon_class: Icon::User,
          placeholder: nil,
          required: nil,
        ),
      ],
      classes: "max-w-sm mx-auto",
    ) do |c|
      c.with_button(
        label: "Submit",
        classes: "block ms-auto",
      )
    end
  end
end
