class Track < ApplicationRecord
  has_many :translations, class_name: "Translations::Track"
  has_many :track_artists
  has_many :artists, through: :track_artists
  belongs_to :album

  class << self
    def find_or_build_by(
      key,
      params,
      locale = "ja"
    )
      track = Track.find_or_initialize_by(key => params[key])
      track.assign_attributes(
        params.slice(
          :disc_number,
          :track_number,
          :duration_ms,
        ),
      )

      build_translation(
        track,
        params[:title],
        locale,
      )

      track
    end

    private

    def build_translation(track, title, locale)
      translation = track.translations.find_by(locale: locale)
      if translation.present?
        translation.title = title
        track.translations << translation

        return translation
      end

      track.translations.build(
        title: title,
        locale: locale,
      )
    end
  end

  def localized_title(locale)
    translations.find_by!(locale: locale).title
  end

  def to_json_hash(locale)
    {
      id: id,
      title: localized_title(locale),
      artists: artists.map { |artist|
        artist.to_json_hash(locale)
      }.uniq,
      disc_number: disc_number,
      track_number: track_number,
      duration_ms: duration_ms,
      spotify_id: spotify_id,
      youtube_music_id: youtube_music_id,
      apple_music_id: apple_music_id,
    }
  end
end
