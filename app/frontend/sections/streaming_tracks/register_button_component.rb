# frozen_string_literal: true

module StreamingTracks
  class RegisterButtonComponent < ViewComponent::Base
    attr_reader :url, :id, :brand_id, :params, :classes

    def initialize(
      url: "",
      id: nil,
      brand_id: nil,
      params: {},
      classes: ""
    )
      @url = url
      @id = id
      @brand_id = brand_id
      @params = params
      @classes = classes
    end

    def disabled?
      id.present?
    end

    def button_label
      disabled? ? "登録済" : "登録"
    end
  end
end
