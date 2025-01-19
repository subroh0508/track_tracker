# frozen_string_literal: true

FactoryBot.define do
  factory :playlist do
    youtube_music_id { ("a".."z").to_a.shuffle[0..7].join }

    trait :with_translations do
      after(:build) do |playlist|
        playlist.translations << build(:translation_playlist_ja)
        playlist.translations << build(:translation_playlist_en)
      end
    end

    trait :without_translation_en do
      after(:build) do |playlist|
        playlist.translations << build(:translation_playlist_ja)
      end
    end
  end

  factory :translation_playlist_ja, class: Translations::Playlist do
    title { "プレイリスト名" }
    locale { "ja" }
  end

  factory :translation_playlist_en, class: Translations::Playlist do
    title { "Playlist Title" }
    locale { "en" }
  end
end
