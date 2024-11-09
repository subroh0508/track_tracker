# frozen_string_literal: true

module Button
  class Preview < ViewComponent::Preview
    def with_default_title
      render Button::Component.new do
        "Default Title"
      end
    end
  end
end
