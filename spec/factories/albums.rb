FactoryBot.define do
  factory :album do
    spotify_id { "MyString" }
    youtube_music_id { "MyString" }
    apple_music_id { "MyString" }
    ean { "4912345678904" }
    upc { "00602445790951"}
    thumbnail_url { "https://example.com/sample.png" }
    release_date { "MyString" }
  end
end
