# frozen_string_literal: true

# @logical_path sections/playlists
class Playlists::TracksPreview < ViewComponent::Preview
  def default
    render Playlists::TracksComponent.new([{
      position: 1,
      thumbnail_url: "https://i.ytimg.com/vi/Bsm9rQc7uew/hq720.jpg",
      title: "シャイノグラフィ - 2023 Ver.",
      artist: "シャイノグラフィ",
    }, {
      position: 10,
      thumbnail_url: "https://i.ytimg.com/vi/Bsm9rQc7uew/hq720.jpg",
      title: "Dye the sky. - 2023 Ver.",
      artist: "シャイノグラフィ",
    }])
  end
end
