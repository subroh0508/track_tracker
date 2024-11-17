# frozen_string_literal: true

module Youtube
  class IframeComponent < ViewComponent::Base
    def initialize(id: nil)
      @id = id
    end

    def embed_url
      raise NotImplementedError
    end

    protected

    attr_reader :id
  end
end
