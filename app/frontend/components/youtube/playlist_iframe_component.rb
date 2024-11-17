# frozen_string_literal: true

module Youtube
  class PlaylistIframeComponent < Youtube::IframeComponent
    def embed_url
      "http://www.youtube.com/embed/videoseries?list=#{id}"
    end
  end
end
