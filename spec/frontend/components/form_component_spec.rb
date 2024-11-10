# frozen_string_literal: true

require "rails_helper"

RSpec.describe Form::Component, type: :component do
  it "renders form" do
    render_inline described_class.new(classes: "max-w-sm mx-auto") do |c|
      c.with_item do
        [
          c.render(Form::LabelComponent.new(
            label_for: "id",
          )) { "ID" },
          c.render(Form::InputComponent.new(
            type: "text",
            id: "id",
          )),
        ].join.html_safe
      end

      c.with_item do
        [
          c.render(Form::LabelComponent.new(
            label_for: "password",
          )) { "Password" },
          c.render(Form::InputComponent.new(
            type: "password",
            id: "password",
          )),
        ].join.html_safe
      end
    end

    expect(page.find("form")["class"]).to include(
      "max-w-sm",
      "mx-auto",
    )
    expect(page).to have_content("ID")
    expect(page).to have_selector("input[id='id']")
    expect(page).to have_content("Password")
    expect(page).to have_selector("input[id='password']")
  end

  it "renders form" do
    render_inline described_class.new do |c|
      c.with_item do
        [
          c.render(Form::LabelComponent.new(
            label_for: "email",
          )) { "Email" },
          c.render(Form::InputComponent.new(
            type: "email",
            id: "email",
          )),
        ].join.html_safe
      end

      c.with_button(
        variant: Button::CONTAINED,
        type: "submit",
      ) { "Submit" }
    end

    expect(page).to have_content("Email")
    expect(page).to have_selector("input[id='email']")
    expect(page).to have_button("Submit")
  end
end
