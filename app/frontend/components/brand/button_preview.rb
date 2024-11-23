# frozen_string_literal: true

# @logical_path components/brand
class Brand::ButtonPreview < ViewComponent::Preview
  # @!group Brands
  def youtube_music
    render_with_template(
      template: "brand/buttons_template",
      locals: { brand: Brand::YOUTUBE_MUSIC },
    )
  end

  def spotify
    render_with_template(
      template: "brand/buttons_template",
      locals: { brand: Brand::SPOTIFY },
    )
  end

  def apple_music
    render_with_template(
      template: "brand/buttons_template",
      locals: { brand: Brand::APPLE_MUSIC },
    )
  end
  # @!endgroup
end
