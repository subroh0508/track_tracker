class Playlist < ApplicationRecord
  self.inheritance_column = :_type_disabled

  enum :type, { album: 0, official: 1, user: 2 }

  has_many :translations, class_name: "Translations::Playlist"
  has_many :playlist_tracks
  has_many :tracks, through: :playlist_tracks

  class << self
    def build(params)
      playlist = Playlist.new(
        type: type_to_enum(params[:type]),
        youtube_id: params[:youtube_id],
      )

      playlist.translations.build(
        title: params[:title],
        locale: params[:locale],
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
  end

  def title(locale)
    translations.find_by!(locale: locale).title
  end
end
