# frozen_string_literal: true

FactoryBot.define do
  factory :artist do
    youtube_channel_id { ("a".."z").to_a.shuffle[0..7].join }

    trait :with_translations do
      after(:build) do |artist|
        artist.translations << build(:translation_artist_ja)
        artist.translations << build(:translation_artist_en)
      end
    end

    trait :without_translation_en do
      after(:build) do |artist|
        artist.translations << build(:translation_artist_ja)
      end
    end
  end

  factory :translation_artist_ja, class: Translations::Artist do
    name { "アーティスト名" }
    locale { "ja" }
  end

  factory :translation_artist_en, class: Translations::Artist do
    name { "Artist Name" }
    locale { "en" }
  end
end
