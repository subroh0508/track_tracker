# frozen_string_literal: true

# @logical_path sections/albums
class Albums::GridPreview < ViewComponent::Preview
  def default
    render Albums::GridComponent.new(
      base_url: "#",
      items: [
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          release_date: "2011-03-18",
          artists: [
            {
              spotify_id: "aaa",
              name: "supercell",
            },
          ],
          spotify_id: "aaa",
          youtube_music_id: "bbb",
          apple_music_id: "ccc",
        },
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d00001e02bfb129acb345001444dc06cf",
          title: "THE IDOLM@STER ORCHESTRA CONCERT　～SYMPHONY OF FIVE STARS!!!!!～ コンサートアルバム",
          release_date: "2023-02-08",
          artists: [
            {
              spotify_id: "bbb",
              name: "東京フィルハーモニー交響楽団,THE IDOLM@STER Series,Bandai Namco Game Music",
            },
          ],
          spotify_id: "aaa",
          youtube_music_id: "bbb",
          apple_music_id: "ccc",
        },
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          release_date: "2011-03-18",
          artists: [
            {
              spotify_id: "aaa",
              name: "supercell",
            },
          ],
          spotify_id: "aaa",
          youtube_music_id: "bbb",
          apple_music_id: "ccc",
        },
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          release_date: "2011-03-18",
          artists: [
            {
              spotify_id: "aaa",
              name: "supercell",
            },
          ],
          spotify_id: "aaa",
          youtube_music_id: "bbb",
          apple_music_id: "ccc",
        },
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          release_date: "2011-03-18",
          artists: [
            {
              spotify_id: "aaa",
              name: "supercell",
            },
          ],
          spotify_id: "aaa",
          youtube_music_id: "bbb",
          apple_music_id: "ccc",
        },
      ],
    )
  end
end
