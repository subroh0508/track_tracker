# frozen_string_literal: true

# @logical_path components
class Input::Preview < ViewComponent::Preview
  # @param placeholder text
  # @param type select { choices: [text, email, number, password, tel, url] }
  def plain(
    placeholder: "Input anything...",
    type: "text"
  )
    render_with_template(
      template: "input/plains_template",
      locals: { placeholder: placeholder, type: type },
    )
  end
end
