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
    def find_or_build_by(
      key,
      params,
      type,
      locale = "ja"
    )
      playlist = Playlist.find_or_initialize_by(
        :type => type,
        key => params[key],
      )

      build_translation(
        playlist,
        params[:title],
        locale,
      )

      playlist
    end

    private

    def build_translation(playlist, title, locale)
      translation = playlist.translations.find_by(locale: locale)
      if translation.present?
        translation.title = title
        playlist.translations << translation

        return translation
      end

      playlist.translations.build(
        title: title,
        locale: locale,
      )
    end
  end

  def build_playlist_track(track, track_number, thumbnail_url)
    return if playlist_tracks.exists?(track: track)

    playlist_tracks.build(
      track: track,
      track_number: track_number,
      thumbnail_url: thumbnail_url,
    )
  end

  def localized_title(locale)
    translations.find_by!(locale: locale).title
  end
end
