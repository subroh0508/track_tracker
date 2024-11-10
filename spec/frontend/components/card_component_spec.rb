# frozen_string_literal: true

require "rails_helper"

RSpec.describe Card::Component, type: :component do
  let(:title) { "Title" }
  let(:description) { "Description" }
  let(:classes) {
    %w[
      bg-white
      dark:bg-neutral-800
    ]
  }

  it "renders card" do
    render_inline described_class.new(classes: "max-w-sm") do |c|
      c.with_header { title }
      c.with_description { description }
    end

    expect(page.find("div.max-w-sm")["class"]).to include(*classes, "p-6")
    expect(page).to have_content(title)
    expect(page).to have_content(description)
  end

  it "renders card with image" do
    render_inline described_class.new(classes: "max-w-sm") do |c|
      c.with_image(src: "https://example.com/image.jpg")
      c.with_header { title }
      c.with_description { description }
    end

    expect(page.find("div.max-w-sm")["class"]).to include(*classes)
    expect(page).to have_selector("img[src='https://example.com/image.jpg']")
    expect(page).to have_content(title)
    expect(page).to have_content(description)
  end
end
