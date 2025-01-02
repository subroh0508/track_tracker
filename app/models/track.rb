class Track < ApplicationRecord
  has_many :translations, class_name: "Translations::Track"
  has_many :track_artists
  has_many :artists, through: :track_artists

    class << self
    def find_or_build_by(params, locale = "ja")
      track = Track.find_or_initialize_by(
        youtube_video_id: params[:youtube_video_id],
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
end
