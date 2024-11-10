# frozen_string_literal: true

module Form
  class LabelComponent < ViewComponent::Base
    attr_reader :label_for

    def initialize(
      label_for: "",
      classes: ""
    )
      @label_for = label_for
      @classes = classes
    end

    def classes
      "#{@classes} mb-2 text-sm font-medium text-neutral-900 dark:text-white"
    end
  end
end
