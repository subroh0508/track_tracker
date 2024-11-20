# frozen_string_literal: true

module Link
  class ButtonComponent < Link::Component
    attr_reader :active

    def initialize(
      href: "#",
      active: false,
      active_color: { text: "text-white", background: "bg-primary-700" },
      classes: "px-4 py-3"
    )
      super(href: href, classes: classes)
      @active = active
      @active_color = active_color
    end

    protected

    def text_style
      [
        "rounded-lg",
        active ? active_text_style : "#{light_text_style} #{dark_text_style}",
      ].join(" ")
    end

    def active_text_style
      "#{active_color[:text]} #{active_color[:background]}"
    end

    def light_text_style
      "text-neutral-500 bg-neutral-50 hover:text-neutral-900 hover:bg-neutral-100"
    end

    def dark_text_style
      "dark:text-neutral-400 dark:bg-neutral-800 dark:hover:text-white dark:hover:bg-neutral-700"
    end

    private

    attr_reader :active_color
  end
end
