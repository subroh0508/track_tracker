# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :translations, class_name: "Translations::Artist"
  has_many :track_artists
  has_many :tracks, through: :track_artists

  class << self
    def find_or_build_by(key, params, locale = "ja")
      if key == :youtube_channel_id
        find_or_build_by_youtube_channel_id(
          params,
          locale,
        )
      else
        artist = Artist.find_or_initialize_by(
          key => params[key],
        )

        build_translation(
          artist,
          params[:name],
          locale,
        )

        artist
      end
    end

    private

    def find_or_build_by_youtube_channel_id(params, locale = "ja")
      translation = Translations::Artist.find_by(
        name: params[:name],
        locale: locale,
      )

      if translation.present?
        return translation.artist
      end

      artist = Artist.find_or_initialize_by(
        youtube_channel_id: params[:youtube_channel_id],
      )

      build_translation(
        artist,
        params[:name],
        locale,
      )

      artist
    end

    def build_translation(artist, name, locale)
      return if artist.translations.exists?(locale: locale)

      artist.translations.build(
        name: name,
        locale: locale,
      )
    end
  end

  def localized_name(locale)
    translations.find_by!(locale: locale).name
  end

  def to_json_hash(locale)
    {
      id: id,
      name: localized_name(locale),
    }
  end
end
