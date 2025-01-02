# frozen_string_literal: true

module Link
  class IconComponent < Link::Component
    attr_reader :icon, :active, :active_text_color

    def initialize(
      href: "#",
      icon: "",
      active: false,
      active_text_color: "bg-neutral-200 dark:bg-neutral-700",
      classes: ""
    )
      super(href: href, classes: classes)

      @icon = icon
      @active = active
      @active_text_color = active_text_color
    end

    protected

    def text_style
      active ? active_text_color : "#{light_text_style} #{dark_text_style}"
    end

    def light_text_style
      "text-neutral-400 hover:text-neutral-900"
    end

    def dark_text_style
      "dark:text-neutral-400 dark:hover:text-white"
    end
  end
end
