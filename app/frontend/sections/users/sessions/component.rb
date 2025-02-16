# frozen_string_literal: true

module Users
  module Sessions
    class Component < ViewComponent::Base
      renders_one :new_password_link, ->(url:) do
        Link::Component.new(
          href: url,
          classes: link_classes,
        ).with_content("パスワードをお忘れの方はこちら")
      end

      renders_one :sign_up_link, ->(url:) do
        Link::Component.new(
          href: url,
          classes: link_classes,
        ).with_content("TrackTrackerに登録する")
      end

      attr_reader :url

      def initialize(url: "#")
        @url = url
      end

      def description_classes
        %w[
          max-w-sm
          mx-auto
        ].join(" ")
      end

      private

      def link_classes
        %w[
          text-sm
          text-primary-700
          dark:text-primary-300
        ].join(" ")
      end
    end
  end
end
