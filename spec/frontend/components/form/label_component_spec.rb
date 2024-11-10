# frozen_string_literal: true

require "rails_helper"

RSpec.describe Form::LabelComponent, type: :component do
  let(:label_for) { "sample" }
  let(:caption) { "caption" }

  it "renders label" do
    render_inline(described_class.new(label_for: label_for)) { caption }

    expect(page).to have_text(caption)
    expect(page.find("label")["class"]).to include(
      "block",
      "text-neutral-900",
      "dark:text-white",
    )
  end
end
