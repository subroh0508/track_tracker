# frozen_string_literal: true

module StreamingTracks
  module Album
    class GridComponent < ViewComponent::Base
      attr_reader :params, :items, :data

      def initialize(
        params: {
          brand: Api::SPOTIFY,
          type: Api::TYPE_ALBUM,
        },
        items: [],
        data: {},
        classes: ""
      )
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
        url_for(
          controller: :streaming_tracks,
          action: :search,
          brand: params[:brand],
          type: Api::TYPE_ALBUM,
          params: query(item),
        )
      end

      def register_url
        url_for(
          controller: :streaming_tracks,
          action: :register,
          brand: params[:brand],
          type: Api::TYPE_ALBUM,
        )
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
        {
          id: params[:id],
          query: params[:query],
        }.merge(streaming_service_id_query(item))
      end

      def streaming_service_id_query(item)
        streaming_service_id(item).
          reduce({}) { |acc, (key, value)| acc.merge(key => value) }
      end
    end
  end
end
