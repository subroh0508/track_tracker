# frozen_string_literal: true

require "rails_helper"

RSpec.describe Card::DescriptionComponent, type: :component do
  let(:description) { "description" }

  it "renders card description" do
    render_inline(described_class.new) { description }

    expect(page.find("p")["class"]).to include(
      "text-neutral-700",
      "dark:text-neutral-400",
    )
  end
end
