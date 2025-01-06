class Album < ApplicationRecord
  has_many :translations, class_name: "Translations::Album"
  has_many :tracks
  has_many :album_artists
  has_many :artists, through: :album_artists

  scope :with_tracks, -> { preload(:tracks) }

  def to_json_hash(locale)
    {
      id: id,
      title: localized_title(locale),
      thumbnail_url: thumbnail_url,
      # year: year,
      artists: artists.map { |artist|
        artist.to_json_hash(locale)
      }.uniq,
      spotify_id: spotify_id,
      youtube_music_id: youtube_music_id,
      apple_music_id: apple_music_id,
    }
  end
end
