# frozen_string_literal: true

require "rails_helper"

RSpec.describe SearchInput::Component, type: :component do
  it "renders search input" do
    render_inline described_class.new(
      id: "default-search",
      label: "Search",
      placeholder: "Search track...",
      classes: "max-w-sm mx-auto",
    )

    expect(page.find("form")["class"]).to include(
      "max-w-sm",
      "mx-auto",
    )
    expect(page.find("label[for='default-search']")).to have_text("Search")
    expect(page).to have_selector("input[id='default-search'][placeholder='Search track...']")
    expect(page.find("button[type='submit']")).to have_text("Search")
  end
end
