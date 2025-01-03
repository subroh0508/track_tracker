# frozen_string_literal: true

# @logical_path sections/streaming_tracks
class StreamingTracks::SelectionListPreview < ViewComponent::Preview
  def default
    render StreamingTracks::SelectionListComponent.new(items: [
      {
        spotify_id: "xxx",
        thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
        title: "Today Is A Beautiful Day",
        year: 2011,
        artist: "supercell",
      },
      {
        youtube_video_id: "yyy",
        thumbnail_url: "https://i.scdn.co/image/ab67616d00001e02bfb129acb345001444dc06cf",
        title: "THE IDOLM@STER ORCHESTRA CONCERT　～SYMPHONY OF FIVE STARS!!!!!～ コンサートアルバム",
        year: 2024,
        artist: "東京フィルハーモニー交響楽団,THE IDOLM@STER Series,Bandai Namco Game Music",
      },
      {
        apple_music_id: "zzz",
        thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
        title: "Today Is A Beautiful Day",
        year: 2011,
        artist: "supercell",
      },
      {
        spotify_id: "xxx",
        youtube_video_id: "yyy",
        apple_music_id: "zzz",
        thumbnail_url: "https://i.scdn.co/image/ab67616d00001e02bfb129acb345001444dc06cf",
        title: "THE IDOLM@STER ORCHESTRA CONCERT　～SYMPHONY OF FIVE STARS!!!!!～ コンサートアルバム",
        year: 2024,
        artist: "東京フィルハーモニー交響楽団,THE IDOLM@STER Series,Bandai Namco Game Music",
      },
      {
        spotify_id: "xxx",
        youtube_video_id: "yyy",
        thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
        title: "Today Is A Beautiful Day",
        year: 2011,
        artist: "supercell",
      },
      {
        youtube_video_id: "yyy",
        apple_music_id: "zzz",
        thumbnail_url: "https://i.scdn.co/image/ab67616d00001e02bfb129acb345001444dc06cf",
        title: "THE IDOLM@STER ORCHESTRA CONCERT　～SYMPHONY OF FIVE STARS!!!!!～ コンサートアルバム",
        year: 2024,
        artist: "東京フィルハーモニー交響楽団,THE IDOLM@STER Series,Bandai Namco Game Music",
      },
      {
        spotify_id: "xxx",
        apple_music_id: "zzz",
        thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
        title: "Today Is A Beautiful Day",
        year: 2011,
        artist: "supercell",
      },
      {
        thumbnail_url: "https://i.scdn.co/image/ab67616d00001e02bfb129acb345001444dc06cf",
        title: "THE IDOLM@STER ORCHESTRA CONCERT　～SYMPHONY OF FIVE STARS!!!!!～ コンサートアルバム",
        year: 2024,
        artist: "東京フィルハーモニー交響楽団,THE IDOLM@STER Series,Bandai Namco Game Music",
      },
      {
        thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
        title: "Today Is A Beautiful Day",
        year: 2011,
        artist: "supercell",
      },
      {
        thumbnail_url: "https://i.scdn.co/image/ab67616d00001e02bfb129acb345001444dc06cf",
        title: "THE IDOLM@STER ORCHESTRA CONCERT　～SYMPHONY OF FIVE STARS!!!!!～ コンサートアルバム",
        year: 2024,
        artist: "東京フィルハーモニー交響楽団,THE IDOLM@STER Series,Bandai Namco Game Music",
      },
    ])
  end
end
