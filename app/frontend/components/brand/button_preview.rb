# frozen_string_literal: true

# @logical_path components/brand
class Brand::ButtonPreview < ViewComponent::Preview
  # @!group Brands
  def youtube_music
    render_with_template(
      template: "brand/buttons_template",
      locals: { brand: Api::YOUTUBE_MUSIC },
    )
  end

  def spotify
    render_with_template(
      template: "brand/buttons_template",
      locals: { brand: Api::SPOTIFY },
    )
  end

  def apple_music
    render_with_template(
      template: "brand/buttons_template",
      locals: { brand: Api::APPLE_MUSIC },
    )
  end
  # @!endgroup
end
