# frozen_string_literal: true

module Link
  class ChipComponent < Link::ButtonComponent
    def initialize(
      href: "#",
      active: false,
      active_color: {
        text: "text-white dark:text-neutral-700",
        background_style: "bg-neutral-700 dark:bg-neutral-200",
      },
      data: {},
      classes: ""
    )
      super(
        href: href,
        active: active,
        active_color: active_color,
        shape: Link::Button::PILL,
        size: Link::Button::EXTRA_SMALL,
        data: data,
        classes: classes,
      )
    end
  end
end
