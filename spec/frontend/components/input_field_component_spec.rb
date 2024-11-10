# frozen_string_literal: true

require "rails_helper"

RSpec.describe InputField::Component, type: :component do
  it "renders input field" do
    render_inline described_class.new(classes: "max-w-sm mx-auto") do |c|
      c.with_item do
        [
          c.render(Form::LabelComponent.new(
            label_for: "id",
            classes: "block",
          )) { "ID" },
          c.render(Form::InputComponent.new(
            type: "text",
            id: "id",
            classes: "block w-full p-2.5",
          )),
        ].join.html_safe
      end

      c.with_item do
        [
          c.render(Form::LabelComponent.new(
            label_for: "password",
            classes: "block",
          )) { "Password" },
          c.render(Form::InputComponent.new(
            type: "password",
            id: "password",
            classes: "block w-full p-2.5",
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

  it "renders input field with button" do
    render_inline described_class.new do |c|
      c.with_item do
        [
          c.render(Form::LabelComponent.new(
            label_for: "email",
            classes: "block",
          )) { "Email" },
          c.render(Form::InputComponent.new(
            type: "email",
            id: "email",
            classes: "block w-full p-2.5",
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