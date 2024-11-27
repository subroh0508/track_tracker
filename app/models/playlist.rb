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
    def build(params)
      playlist = Playlist.find_or_initialize_by(
        type: type_to_enum(params[:type]),
        youtube_playlist_id: params[:youtube_playlist_id],
      )

      unless playlist.translations.exists?(locale: params[:locale])
        playlist.translations.build(
          title: params[:title],
          locale: params[:locale],
        )
      end

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
  end

  def localized_title(locale)
    translations.find_by!(locale: locale).title
  end
end
