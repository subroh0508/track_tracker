# frozen_string_literal: true

require "rails_helper"

RSpec.describe InputField::Component, type: :component do
  it "renders input field" do
    render_inline described_class.new(
      items: [
        InputField::Item.new(
          id: "id",
          label: "ID",
          type: "text",
          placeholder: nil,
          required: nil,
        ),
        InputField::Item.new(
          id: "password",
          label: "Password",
          type: "password",
          placeholder: nil,
          required: nil,
        ),
      ],
      classes: "max-w-sm mx-auto",
    )

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
    render_inline described_class.new(
      items: [
        InputField::Item.new(
          id: "email",
          label: "Email",
          type: "email",
          placeholder: "name@example.com",
          required: true,
        ),
      ],
      button_label: "Submit",
    )

    expect(page).to have_content("Email")
    expect(page).to have_selector("input[id='email'][placeholder='name@example.com'][required]")
    expect(page).to have_button("Submit")
  end
end
