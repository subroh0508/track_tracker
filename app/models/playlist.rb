class Playlist < ApplicationRecord
  module Brand
    QUERY_YOUTUBE_MUSIC = "youtubemusic"
    QUERY_SPOTIFY = "spotify"
    QUERY_APPLE_MUSIC = "applemusic"
  end

  self.inheritance_column = :_type_disabled

  enum :type, { album: 0, official: 1, user: 2 }

  has_many :translations, class_name: "Translations::Playlist"
  has_many :playlist_tracks
  has_many :tracks, through: :playlist_tracks

  class << self
    def find_or_build_by(params, type, locale = "ja")
      playlist = Playlist.find_or_initialize_by(
        type: type,
        youtube_playlist_id: params[:youtube_playlist_id],
      )

      build_translation(
        playlist,
        params[:title],
        locale,
      )

      playlist
    end

    private

    def type_to_enum(type)
      case type
      when "album"
        0
      when "official"
        1
      when "user"
        2
      else
        throw ArgumentError
      end
    end

    def build_translation(playlist, title, locale)
      return if playlist.translations.exists?(locale: locale)

      playlist.translations.build(
        title: title,
        locale: locale,
      )
    end
  end

  def build_playlist_track(track, position)
    return if playlist_tracks.exists?(track: track)

    playlist_tracks.build(
      position: position,
      track: track,
    )
  end

  def localized_title(locale)
    translations.find_by!(locale: locale).title
  end
end
