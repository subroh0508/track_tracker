# frozen_string_literal: true

module InputField
  class Preview < ViewComponent::Preview
    def default
      render InputField::Component.new(classes: "max-w-sm mx-auto") do |c|
        c.with_item do
          [
            c.render(Form::LabelComponent.new(
              label_for: "email",
              classes: "block",
            )) { "Email" },
            c.render(Form::InputComponent.new(
              type: "email",
              id: "email",
              placeholder: "name@example.com",
              required: true,
              classes: "block w-full p-2.5",
            )),
          ].join.html_safe
        end

        c.with_item do
          [
            c.render(Form::LabelComponent.new(
              label_for: "name",
              classes: "block",
            )) { "Name" },
            c.render(Form::InputComponent.new(
              type: "text",
              id: "name",
              classes: "block w-full p-2.5",
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
