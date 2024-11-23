# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :translations, class_name: "Translations::Artist"
  has_many :tracks

  class << self
    def build(params)
      artist = Artist.new(
        youtube_channel_id: params[:youtube_channel_id],
      )

      artist.translations.build(
        name: params[:name],
        locale: params[:locale],
      )

      artist
    end
  end

  def localized_name(locale)
    translations.find_by!(locale: locale).name
  end
end
