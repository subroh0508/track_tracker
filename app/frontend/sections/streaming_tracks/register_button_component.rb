# frozen_string_literal: true

module StreamingTracks
  class RegisterButtonComponent < ViewComponent::Base
    attr_reader :url, :id, :streaming_service_id, :params, :classes

    def initialize(
      url: "",
      id: nil,
      streaming_service_id: {},
      params: {},
      classes: ""
    )
      @url = url
      @id = id
      @streaming_service_id = streaming_service_id
      @params = params
      @classes = classes
    end

    def disabled?
      id.present?
    end

    def button_label
      t("common.#{disabled? ? 'registered' : 'register'}")
    end
  end
end
