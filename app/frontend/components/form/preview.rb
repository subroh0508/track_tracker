# frozen_string_literal: true

module Form
  class Preview < ViewComponent::Preview
    def default
      render Form::Component.new(classes: "max-w-sm mx-auto") do |c|
        c.with_item do
          [
            c.render(Form::LabelComponent.new(
              label_for: "email",
            )) { "Email" },
            c.render(Form::InputComponent.new(
              type: "email",
              id: "email",
              placeholder: "name@example.com",
              required: true,
            )),
          ].join.html_safe
        end

        c.with_item do
          [
            c.render(Form::LabelComponent.new(
              label_for: "name",
            )) { "Name" },
            c.render(Form::InputComponent.new(
              type: "text",
              id: "name",
            )),
          ].join.html_safe
        end

        c.with_button(
          variant: Button::CONTAINED,
          type: "submit",
        ) { "Submit" }
      end
    end
  end
end
