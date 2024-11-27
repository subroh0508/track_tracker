# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :translations, class_name: "Translations::Artist"
  has_many :tracks

  class << self
    def build(params)
      artist = Artist.find_or_initialize_by(
        youtube_channel_id: params[:youtube_channel_id],
      )

      artist.build_translation(
        name: params[:name],
        locale: params[:locale],
      )

      artist
    end
  end

  def localized_name(locale)
    translations.find_by!(locale: locale).name
  end

  private

  def build_translation(name, locale)
    return if translations.exists?(locale: locale)

    translations.build(
      name: name,
      locale: locale,
    )
  end
end
