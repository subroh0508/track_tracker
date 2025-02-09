# frozen_string_literal: true

# @logical_path components
class Dropdown::Preview < ViewComponent::Preview
  @@items = [
    { label: "設定", href: "#", active: true },
    { label: "ログアウト", href: "#", active: false },
  ]

  def left
    render Dropdown::Component.new(
      button_classes: "flex w-full px-2",
      classes: "w-56",
    ) do |c|
      c.with_button do
        c.render Icon::CircleUser.new
      end

      @@items.each do |item|
        c.with_item do
          c.render Dropdown::ListComponent.new(
            active: item[:active],
            href: item[:href],
          ) do
            item[:label]
          end
        end
      end
    end
  end

  def right
    render Dropdown::Component.new(
      anchor: Dropdown::Anchor::RIGHT_BOTTOM,
      button_classes: "flex justify-end w-full px-2",
      classes: "w-56 mx-2",
    ) do |c|
      c.with_button do
        c.render Icon::CircleUser.new
      end

      @@items.each do |item|
        c.with_item do
          c.render Dropdown::ListComponent.new(
            active: item[:active],
            href: item[:href],
          ) do
            item[:label]
          end
        end
      end
    end
  end
end
