# frozen_string_literal: true

module StreamingTracks
  module SearchForm
    class InputFieldComponent < ViewComponent::Base
      attr_reader :url, :params, :data, :classes

      def initialize(
        url: "",
        params: {
          brand: Api::SPOTIFY,
        },
        data: {},
        classes: ""
      )
        @url = url
        @params = params
        @data = data
        @classes = classes
      end

      def id
        params[:id].presence
      end

      def query
        params[:query].presence
      end

      def label_classes(form_id)
        [
          visible?(form_id) ? "block" : "hidden",
          "mb-2",
        ].join(" ")
      end

      def input_type(form_id)
        visible?(form_id) ? "search" : "hidden"
      end

      private

      def visible?(form_id)
        case form_id
        when StreamingTracks::FORM_QUERY
          params[:brand] != Api::YOUTUBE_MUSIC
        when StreamingTracks::FORM_ID
          params[:brand] == Api::YOUTUBE_MUSIC
        else
          false
        end
      end
    end
  end
end
