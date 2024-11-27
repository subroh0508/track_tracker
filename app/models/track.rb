class Track < ApplicationRecord
  has_many :translations, class_name: "Translations::Track"
  belongs_to :artist

  class << self
    def build(params)
      track = Track..find_or_initialize_by(
        youtube_video_id: params[:youtube_video_id],
      )

      unless track.translations.exists?(locale: params[:locale])
        track.translations.build(
          title: params[:title],
          locale: params[:locale],
        )
      end

      track.artist = Artist.build(params[:artist])

      track
    end
  end

  def localized_title(locale)
    translations.find_by!(locale: locale).title
  end
end
