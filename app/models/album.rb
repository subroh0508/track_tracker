class Album < ApplicationRecord
  has_many :translations, class_name: "Translations::Album"
  has_many :album_tracks
  has_many :tracks, through: :album_tracks
  has_many :artists

  scope :with_tracks, -> { preload(:album_tracks, :tracks) }
end
