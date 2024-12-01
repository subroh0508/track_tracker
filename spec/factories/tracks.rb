# frozen_string_literal: true

FactoryBot.define do
  factory :track do
    youtube_video_id { ("a".."z").to_a.shuffle[0..7].join }
    artist

    trait :with_translations do
      after(:build) do |track|
        track.translations << build(:translation_track_ja)
        track.translations << build(:translation_track_en)
      end
    end

    trait :without_translation_en do
      after(:build) do |track|
        track.translations << build(:translation_track_ja)
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
