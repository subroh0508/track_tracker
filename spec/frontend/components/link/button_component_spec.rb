# frozen_string_literal: true

require "rails_helper"

RSpec.describe Link::ButtonComponent, type: :component do
  let(:label) { "Example Link" }
  let(:href) { "/example" }

  it "renders a when deactivate" do
    render_inline(described_class.new(
      href: href,
    )) { label }

    expect(page).to have_link(label, href: href)
    expect(page.find("a")["class"]).to include(
      "rounded-lg",
      "inline-flex",
      "items-center",
      "text-neutral-500",
      "bg-neutral-50",
      "hover:text-neutral-900",
      "hover:bg-neutral-200",
      "dark:text-neutral-400",
      "dark:bg-neutral-800",
      "dark:hover:text-white",
      "dark:hover:bg-neutral-700",
    )
  end

  it "renders a when activate" do
    render_inline(described_class.new(
      href: href,
      active: true,
    )) { label }

    expect(page).to have_link(label, href: href)
    expect(page.find("a")["class"]).to include(
      "rounded-lg",
      "text-white",
      "bg-primary-700",
    )
  end
end
