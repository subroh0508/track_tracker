# frozen_string_literal: true

module Root
  class NavbarComponent < ViewComponent::Base
    attr_reader :current_user, :path_sign_in, :path_sign_out, :menus

    def initialize(
      current_user: nil,
      path_sign_in: "#",
      path_sign_out: "#",
      menus: []
    )
      @current_user = current_user
      @path_sign_in = path_sign_in
      @path_sign_out = path_sign_out
      @menus = menus
    end

    def signed_in?
      current_user.present?
    end

    def nav_classes
      [
        "fixed",
        background_style,
        layout_style,
        border_style,
      ].join(" ")
    end

    def classes
      %w[
        max-w-screen-xl
        flex
        flex-wrap
        items-center
        justify-between
        mx-auto
        p-4
      ].join(" ")
    end

    def logo_classes
      %w[
        flex
        items-center
        space-x-3
      ].join(" ")
    end

    def menus_classes
      [
        "items-center",
        "justify-between",
        default_menu_style,
        medium_menu_style,
      ].join(" ")
    end

    private

    def background_style
      [
        light_background_style,
        dark_background_style,
      ].join(" ")
    end

    def layout_style
      %w[
        w-full
        z-20
        top-0
        start-0
      ].join(" ")
    end

    def border_style
      [
        "border-b",
        light_border_style,
        dark_border_style,
      ].join(" ")
    end

    def light_background_style
      "bg-white"
    end

    def dark_background_style
      "dark:bg-neutral-900"
    end

    def light_border_style
      "border-neutral-200"
    end

    def dark_border_style
      "dark:border-neutral-700"
    end

    def default_menu_style
      %w[
        hidden
        w-full
      ].join(" ")
    end

    def medium_menu_style
      %w[
        md:flex
        md:w-auto
        md:order-1
      ].join(" ")
    end
  end
end
