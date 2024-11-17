class Playlist < ApplicationRecord
  enum type: { album: 0, official: 1, user: 2 }

  has_many :translations, class_name: 'Translations::Playlist'
  has_many :tracks, through: :playlist_tracks
end
