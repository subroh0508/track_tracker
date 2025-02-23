# frozen_string_literal: true

module StreamingTracks
  module SearchForm
    class Component < ViewComponent::Base
      attr_reader :params, :data, :classes

      def initialize(
        params: {
          brand: Api::SPOTIFY,
          type: Api::TYPE_ALBUM,
        },
        data: {},
        classes: ""
      )
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
          flex
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
        url_for(
          controller: :streaming_tracks,
          action: :search,
          brand: Api::SPOTIFY,
          type: params[:type],
          params: query,
        )
      end

      def href_apple_music
        url_for(
          controller: :streaming_tracks,
          action: :search,
          brand: Api::APPLE_MUSIC,
          type: params[:type],
          params: query,
        )
      end

      def href_youtube_music
        url_for(
          controller: :streaming_tracks,
          action: :search,
          brand: Api::YOUTUBE_MUSIC,
          type: params[:type],
          params: query,
        )
      end

      def search_by_album_path
        url_for(
          controller: :streaming_tracks,
          action: :search,
          brand: params[:brand],
          type: Api::TYPE_ALBUM,
          params: query,
        )
      end

      private

      def query
        params.slice(:id, :query)
      end
    end
  end
end
