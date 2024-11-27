class Track < ApplicationRecord
  has_many :translations, class_name: "Translations::Track"
  belongs_to :artist

  class << self
    def build(params)
      track = Track.find_or_initialize_by(
        youtube_video_id: params[:youtube_video_id],
      )

      track.build_translation(
        title: params[:title],
        locale: params[:locale],
      )
      track.artist = Artist.build(params[:artist])

      track
    end
  end

  def localized_title(locale)
    translations.find_by!(locale: locale).title
  end

  private

  def build_translation(title, locale)
    return if translations.exists?(locale: locale)

    translations.build(
      title: title,
      locale: locale,
    )
  end
end
