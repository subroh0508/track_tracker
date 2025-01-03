# frozen_string_literal: true

require "rails_helper"

RSpec.describe Brand::ButtonComponent, type: :component do
  shared_examples "button renders" do |args|
    let(:brand) { args[0] }
    let(:label) { args[1] }
    let(:anchor_classes) { args[2] }
    let(:icon) { args[3] }

    let(:href) { "/example" }
    let(:icon_classes) { ["fab", icon, "fa-lg"] }

    it "renders brand button when deactivate" do
      render_inline(described_class.new(
        brand: brand,
        href: href,
      ))

      expect(page).to have_link(label, href: href)
      expect(page).to have_selector("a")
      expect(page.find("i")["class"]).to include(*icon_classes)
    end

    it "renders brand button when activate" do
      render_inline(described_class.new(
        brand: brand,
        href: href,
        active: true,
      ))

      expect(page).to have_link(label, href: href)
      expect(page.find("i")["class"]).to include(*icon_classes)
      expect(page.find("a")["class"]).to include(*anchor_classes)
    end
  end

  it_behaves_like "button renders", [
    Api::YOUTUBE_MUSIC,
    Brand::YOUTUBE_MUSIC,
    %w[text-white bg-youtubemusic],
    "fa-youtube",
  ]
  it_behaves_like "button renders", [
    Api::SPOTIFY,
    Brand::SPOTIFY,
    %w[text-black bg-spotify],
    "fa-spotify",
  ]
  it_behaves_like "button renders", [
    Api::APPLE_MUSIC,
    Brand::APPLE_MUSIC,
    %w[text-white bg-applemusic],
    "fa-apple",
  ]
end
