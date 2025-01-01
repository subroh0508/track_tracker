# frozen_string_literal: true

module Root
  class LogoComponent < ViewComponent::Base
    def classes
      %w[
        self-center
        text-2xl
        font-semibold
        whitespace-nowrap
        dark:text-white
      ].join(" ")
    end
  end
end
