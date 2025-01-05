# frozen_string_literal: true

module StreamingTracks
  module SearchForm
    class Component < ViewComponent::Base
      attr_reader :base_url, :params, :data, :classes

      def initialize(
        base_url: "",
        params: {
          brand: Api::SPOTIFY,
          type: Api::TYPE_ALBUM,
        },
        data: {},
        classes: ""
      )
        @base_url = base_url
        @params = params
        @data = data
        @classes = classes
      end

      def classes
        [
          "flex",
          "flex-col",
          "gap-3",
          @classes,
        ].join(" ")
      end

      def tab_classes
        %w[
          grid
          grid-flow-col
          justify-stretch
          gap-2
        ].join(" ")
      end

      def spotify?
        params[:brand] == Api::SPOTIFY
      end

      def apple_music?
        params[:brand] == Api::APPLE_MUSIC
      end

      def youtube_music?
        params[:brand] == Api::YOUTUBE_MUSIC
      end

      def href_spotify
        "#{base_url}/#{Api::SPOTIFY}/#{params[:type]}/search#{query}"
      end

      def href_apple_music
        "#{base_url}/#{Api::APPLE_MUSIC}/#{params[:type]}/search#{query}"
      end

      def href_youtube_music
        "#{base_url}/#{Api::YOUTUBE_MUSIC}/#{params[:type]}/search#{query}"
      end

      def search_by_album_path
        "#{base_url}/#{params[:brand]}/#{Api::TYPE_ALBUM}/search"
      end

      private

      def query
        params[:query].present? ? "?query=#{params[:query]}" : ""
      end
    end
  end
end
