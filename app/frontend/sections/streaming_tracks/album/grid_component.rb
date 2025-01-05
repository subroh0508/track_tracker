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
        "#{base_url}/#{params[:brand]}/#{Api::TYPE_ALBUM}/search#{query}&target_id=#{brand_id(item)}"
      end

      def register_url
        "#{base_url}/#{params[:brand]}/#{Api::TYPE_ALBUM}"
      end

      def brand_id(item)
        case params[:brand]
        when Api::SPOTIFY
          item[:spotify_id]
        when Api::YOUTUBE_MUSIC
          item[:youtube_music_id]
        when Api::APPLE_MUSIC
          item[:apple_music_id]
        else
          throw ArgumentError.new("Unknown brand: #{params[:brand]}")
        end
      end

      private

      def query
        "?id=#{params[:id]}&query=#{params[:query]}"
      end
    end
  end
end
