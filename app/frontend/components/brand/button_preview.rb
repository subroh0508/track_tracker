# frozen_string_literal: true

module Brand
  class ButtonPreview < ViewComponent::Preview
    # @!group Brands
    def youtube
      render_with_template(
        template: "brand/buttons_template",
        locals: { brand: Brand::YOUTUBE_MUSIC },
      )
    end
    # @!endgroup
  end
end
