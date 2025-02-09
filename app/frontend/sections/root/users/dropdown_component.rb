# frozen_string_literal: true

module Root
  module Users
    class DropdownComponent < ViewComponent::Base
      attr_reader :menus, :classes

      def initialize(
        menus: [],
        classes: ""
      )
        @menus = menus
        @classes = classes
      end
    end
  end
end
