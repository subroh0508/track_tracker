# frozen_string_literal: true

module Youtube
  module Button
    class Preview < ViewComponent::Preview
      # @!group Brands
      def youtube
        render_with_template(template: "youtube/button/youtube_buttons_template")
      end
      # @!endgroup
    end
  end
end
