# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :translations, class_name: "Translations::Artist"
  has_many :tracks

  class << self
    def build(params, locale = "ja")
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

    private

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
end
