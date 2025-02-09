# frozen_string_literal: true

require "rails_helper"

RSpec.describe Button::Component, type: :component do
  let(:caption) { "caption" }

  it "renders text button" do
    render_inline(described_class.new(variant: Button::TEXT)) { caption }

    expect(page).to have_text(caption)
    expect(page.find("button")["class"]).to include(
      "text-primary-700",
      "hover:bg-primary-100",
      "dark:text-primary-300",
      "dark:hover:bg-primary-900",
      "rounded-lg",
    )
  end

  it "renders contained button" do
    render_inline(described_class.new(variant: Button::CONTAINED)) { caption }

    expect(page).to have_text(caption)
    expect(page.find("button")["class"]).to include(
      "text-white",
      "bg-primary-700",
      "hover:bg-primary-800",
      "dark:bg-primary-600",
      "dark:hover:bg-primary-700",
      "rounded-lg",
    )
  end

  it "renders outlined button" do
    render_inline(described_class.new(variant: Button::OUTLINED)) { caption }

    expect(page).to have_text(caption)
    expect(page.find("button")["class"]).to include(
      "text-primary-700",
      "hover:text-white",
      "hover:bg-primary-800",
      "dark:text-primary-300",
      "dark:hover:text-white",
      "dark:hover:bg-primary-700",
      "rounded-lg",
      "border",
      "dark:border-primary-500",
      "dark:hover:border-primary-700",
    )
  end
end
