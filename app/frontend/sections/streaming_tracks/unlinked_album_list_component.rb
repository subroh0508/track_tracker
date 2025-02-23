# frozen_string_literal: true

module StreamingTracks
  class UnlinkedAlbumListComponent < ViewComponent::Base
    attr_reader :params, :target_album, :items, :data

    def initialize(
      params: {
        brand: Api::SPOTIFY,
        type: Api::TYPE_ALBUM,
      },
      target_album: nil,
      items: [],
      data: {}
    )
      @params = params
      @target_album = target_album
      @items = items
      @data = data
    end

    def header_text
      "登録可能なアルバム: #{items.size}件"
    end

    def header_classes
      "mb-3 text-lg font-bold #{light_header_style} #{dark_header_style}"
    end

    def streaming_service_id(hash)
      return {} if hash.blank?

      hash.slice(
        Streaming::KEY_SPOTIFY,
        Streaming::KEY_APPLE_MUSIC,
        Streaming::KEY_YOUTUBE_MUSIC,
      ).compact
    end

    def brand_id(hash)
      [
        Streaming::KEY_SPOTIFY,
        Streaming::KEY_APPLE_MUSIC,
        Streaming::KEY_YOUTUBE_MUSIC,
      ].each do |key|
        return key if (hash || {}).key?(key)
      end
    end

    def href_back
      url_for(
        controller: :streaming_tracks,
        action: :search,
        brand: params[:brand],
        type: params[:type],
        params: params.slice(:id, :query),
      )
    end

    def link_url(id)
      url_for(
        controller: :streaming_tracks,
        action: :link,
        brand: params[:brand],
        type: params[:type],
        target_id: id,
      )
    end

    private

    def light_header_style
      "text-neutral-900"
    end

    def dark_header_style
      "dark:text-white"
    end
  end
end
