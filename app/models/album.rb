class Album < ApplicationRecord
  has_many :translations, class_name: "Translations::Album"
  has_many :tracks
  has_many :album_artists
  has_many :artists, through: :album_artists

  scope :with_tracks, -> { preload(:tracks) }
  scope :with_translations, -> { preload(:translations) }

  class << self
    def find_or_build_by(
      key,
      params,
      locale = "ja"
    )
      album = Album.find_or_initialize_by(key => params[key])
      album.assign_attributes(
        params.slice(
          :thumbnail_url,
          :release_date,
        ),
      )

      build_translation(
        album,
        params[:title],
        locale,
      )

      album
    end

    private

    def build_translation(
      album,
      title,
      locale
    )
      translation = album.translations.find_by(locale: locale)
      if translation.present?
        translation.title = title
        album.translations << translation

        return translation
      end

      album.translations.build(
        title: title,
        locale: locale,
      )
    end
  end

  def localized_title!(locale, default_locale = nil)
    return translations.find_by!(locale: locale).title if default_locale.blank?

    (translations.find_by(locale: locale) ||
      translations.find_by(locale: default_locale) ||
      translations.first).title
  end

  def to_json_hash!(locale, default_locale = "ja")
    {
      id: id,
      title: localized_title!(locale, default_locale),
      thumbnail_url: thumbnail_url,
      release_date: release_date,
      artists: artists.map { |artist|
        artist.to_json_hash!(locale, default_locale)
      }.uniq,
      spotify_id: spotify_id,
      youtube_music_id: youtube_music_id,
      apple_music_id: apple_music_id,
    }
  end
end
