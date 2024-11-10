# frozen_string_literal: true

require "rails_helper"

RSpec.describe Form::InputComponent, type: :component do
  let(:id) { "sample" }
  let(:classes) {
    %w[
      bg-neutral-50
      text-neutral-900
      dark:bg-neutral-700
      dark:placeholder-neutral-400
      dark:text-white
    ]
  }

  it "renders input" do
    render_inline(described_class.new(
      id: id,
    ))

    expect(page.find("input")["type"]).to eq("text")
    expect(page.find("input")["id"]).to eq(id)
    expect(page.find("input")["placeholder"]).to be_blank
    expect(page.find("input")["required"]).to be_nil
    expect(page.find("input")["class"]).to include(*classes)
  end

  it "renders input with params" do
    render_inline(described_class.new(
      type: "email",
      id: id,
      placeholder: "name@example.com",
      required: true,
    ))

    expect(page.find("input")["type"]).to eq("email")
    expect(page.find("input")["id"]).to eq(id)
    expect(page.find("input")["placeholder"]).to eq("name@example.com")
    expect(page.find("input")["required"]).not_to be_nil
    expect(page.find("input")["class"]).to include(*classes)
  end
end
