# frozen_string_literal: true

module StreamingTracks
  module Album
    class GridComponent < ViewComponent::Base
      attr_reader :base_url, :params, :items, :data

      def initialize(
        base_url: "",
        params: {
          brand: Api::SPOTIFY,
          type: Api::TYPE_ALBUM,
        },
        items: [],
        data: {},
        classes: ""
      )
        @base_url = base_url
        @params = params
        @items = items
        @data = data
        @classes = classes
      end

      def classes
        [
          @classes,
          "grid",
          "grid-cols-auto-fill-180",
          "gap-6",
        ].join(" ")
      end

      def href_select(item)
        "#{base_url}/#{params[:brand]}/#{Api::TYPE_ALBUM}/search?#{query(item)}"
      end

      def register_url
        "#{base_url}/#{params[:brand]}/#{Api::TYPE_ALBUM}"
      end

      def streaming_service_id(item)
        item.slice(
          Streaming::KEY_SPOTIFY,
          Streaming::KEY_APPLE_MUSIC,
          Streaming::KEY_YOUTUBE_MUSIC,
        ).compact
      end

      private

      def query(item)
        [
          "id=#{params[:id]}",
          "query=#{params[:query]}",
          streaming_service_id_query(item),
        ].join("&")
      end

      def streaming_service_id_query(item)
        streaming_service_id(item).
          map { |key, value| "#{key}=#{value}" }.
          join("&")
      end
    end
  end
end
