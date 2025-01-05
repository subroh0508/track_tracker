# frozen_string_literal: true

module StreamingTracks
  class UnlinkedAlbumListComponent < ViewComponent::Base
    attr_reader :base_url, :params, :target_id, :items, :data

    def initialize(
      base_url: "",
      params: {
        brand: Api::SPOTIFY,
        type: Api::TYPE_ALBUM,
      },
      target_id: nil,
      items: [],
      data: {}
    )
      @base_url = base_url
      @params = params
      @target_id = target_id
      @items = items
      @data = data
    end

    def header_text
      "登録可能なアルバム: #{items.size}件"
    end

    def header_classes
      "mb-3 text-lg font-bold #{light_header_style} #{dark_header_style}"
    end

    def href_back
      "#{base_url}/#{params[:brand]}/#{params[:type]}/search#{query}"
    end

    def link_url
      "#{base_url}/#{params[:brand]}/#{params[:type]}/#{target_id}"
    end

    private

    def light_header_style
      "text-neutral-900"
    end

    def dark_header_style
      "dark:text-white"
    end

    def query
      "?id=#{params[:id]}&query=#{params[:query]}"
    end
  end
end
