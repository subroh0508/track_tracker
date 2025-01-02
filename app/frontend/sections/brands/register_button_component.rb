# frozen_string_literal: true

module Brands
  class RegisterButtonComponent < ViewComponent::Base
    attr_reader :url, :id, :brand_id, :query, :classes

    def initialize(
      url: "",
      id: nil,
      brand_id: nil,
      query: "",
      classes: ""
    )
      @url = url
      @id = id
      @brand_id = brand_id
      @query = query
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
