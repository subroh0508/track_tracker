# frozen_string_literal: true

# @logical_path components
class Dropdown::Preview < ViewComponent::Preview
  def default
    render Dropdown::Component.new do |c|
      c.with_button do
        c.render Icon::CircleUser.new
      end
      [
        { label: "設定", href: "#" },
        { label: "ログアウト", href: "#" },
      ].each do |item|
        c.with_item do
          c.render Link::TextComponent.new(
            href: item[:href],
          ) do
            item[:label]
          end
        end
      end
    end
  end
end
