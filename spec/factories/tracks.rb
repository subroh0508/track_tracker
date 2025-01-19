# frozen_string_literal: true

FactoryBot.define do
  factory :track do
    youtube_music_id { ("a".."z").to_a.shuffle[0..7].join }
    disc_number { 1 }
    track_number { 1 }

    transient do
      album { build(:album) }
    end

    trait :with_translations do
      after(:build) do |track, evaluator|
        evaluator.album.tracks << track

        track.translations << build(:translation_track_ja)
        track.translations << build(:translation_track_en)

        track.artists << build(:artist, :with_translations)
      end
    end

    trait :without_translation_en do
      after(:build) do |track, evaluator|
        evaluator.album.tracks << track

        track.translations << build(:translation_track_ja)

        track.artists << build(:artist, :without_translation_en)
      end
    end
  end

  factory :translation_track_ja, class: Translations::Track do
    title { "曲名" }
    locale { "ja" }
  end

  factory :translation_track_en, class: Translations::Track do
    title { "Track Title" }
    locale { "en" }
  end
end
