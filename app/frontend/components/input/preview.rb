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

  # @param placeholder text
  # @param type select { choices: [text, email, number, password, tel, url] }
  def with_icon(
    placeholder: "Input anything...",
    type: "text"
  )
    render_with_template(
      template: "input/with_icons_template",
      locals: { placeholder: placeholder, type: type },
    )
  end

  # @param placeholder text
  # @param type select { choices: [text, email, number, password, tel, url] }
  # @param button_label text
  def with_icon_and_button(
    placeholder: "Input anything...",
    type: "text",
    button_label: "Go"
  )
    render_with_template(
      template: "input/with_icon_and_buttons_template",
      locals: { placeholder: placeholder, type: type, button_label: button_label },
    )
  end

  def toggle
    render_with_template(
      template: "input/toggles_template",
    )
  end
end
