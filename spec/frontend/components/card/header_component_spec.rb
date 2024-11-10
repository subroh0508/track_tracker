# frozen_string_literal: true

require "rails_helper"

RSpec.describe Card::HeaderComponent, type: :component do
  let(:title) { "Title" }

  it "renders card header" do
    render_inline(described_class.new) { title }

    expect(page.find("h5")["class"]).to include(
      "text-neutral-900",
      "dark:text-white",
    )
  end
end
