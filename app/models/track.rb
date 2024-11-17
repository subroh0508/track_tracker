class Track < ApplicationRecord
  has_many :translations, class_name: "Translations::Track"

  class << self
    def build(params)
      track = Track.new(
        youtube_id: params[:youtube_id],
      )

      track.translations.build(
        title: params[:title],
        locale: params[:locale],
      )

      track
    end
  end

  def localized_title(locale)
    translations.find_by!(locale: locale).title
  end
end
