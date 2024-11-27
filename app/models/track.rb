class Track < ApplicationRecord
  has_many :translations, class_name: "Translations::Track"
  belongs_to :artist

  class << self
    def build(params, locale = "ja")
      track = Track.find_or_initialize_by(
        youtube_video_id: params[:youtube_video_id],
      )

      build_translation(
        track,
        params[:title],
        locale,
      )
      track.artist = Artist.build(
        params[:artist],
        locale,
      )

      track
    end

    private

    def build_translation(track, title, locale)
      return if track.translations.exists?(locale: locale)

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
