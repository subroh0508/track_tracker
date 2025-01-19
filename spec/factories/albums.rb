FactoryBot.define do
  factory :album do
    spotify_id { ("a".."z").to_a.shuffle[0..12].join }
    youtube_music_id { ("a".."z").to_a.shuffle[0..7].join }
    apple_music_id { ("a".."z").to_a.shuffle[0..10].join }
    # ean { "4912345678904" }
    # upc { "00602445790951" }
    thumbnail_url { "https://example.com/sample.png" }
    release_date { "MyString" }

    trait :with_translations do
      after(:build) do |album|
        album.translations << build(:translation_album_ja)
        album.translations << build(:translation_album_en)

        album.artists << build(:artist, :with_translations)
      end
    end

    trait :without_translation_en do
      after(:build) do |album|
        album.translations << build(:translation_album_ja)

        album.artists << build(:artist, :without_translation_en)
      end
    end
  end

  factory :translation_album_ja, class: Translations::Album do
    title { "アルバム名" }
    locale { "ja" }
  end

  factory :translation_album_en, class: Translations::Album do
    title { "Album Title" }
    locale { "en" }
  end
end
