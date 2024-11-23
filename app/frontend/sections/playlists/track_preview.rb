# frozen_string_literal: true

# @logical_path sections/playlists
class Playlists::TrackPreview < ViewComponent::Preview
  # @param index number
  # @param thumbnail_url url
  # @param title text
  # @param artist
  def default(
    index: 1,
    thumbnail_url: "https://i.ytimg.com/vi/Bsm9rQc7uew/hq720.jpg",
    title: "シャイノグラフィ - 2023 Ver.",
    artist: "シャイニーカラーズ"
  )
    render Playlists::TrackComponent.new({
      index: index,
      thumbnail_url: thumbnail_url,
      title: title,
      artist: artist,
    })
  end
end
