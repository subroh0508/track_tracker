# frozen_string_literal: true

# @logical_path sections/playlists
class Playlists::HeaderPreview < ViewComponent::Preview
  # @param playlist_title text
  # @param brand select { choices: [none, youtubemusic, spotify, applemusic] }
  def default(
    playlist_title: "THE IDOLM@STER SHINY COLORS BRILLI@NT WING 01 Spread the Wings!!",
    brand: "none"
  )
    render Playlists::HeaderComponent.new(
      title: playlist_title,
      active_brand: brand,
      )
  end
end
