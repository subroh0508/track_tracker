class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all.map { |playlist|
      {
        id: playlist.id,
        youtube_playlist_id: playlist.youtube_playlist_id,
        title: playlist.localized_title("ja"),
        tracks: playlist.tracks.map { |track|
          {
            id: track.id,
            youtube_video_id: track.youtube_video_id,
            title: track.localized_title("ja"),
            artist: {
              id: track.artist.id,
              youtube_channel_id: track.artist.youtube_channel_id,
              name: track.artist.localized_name("ja"),
            },
          }
        },
      }
    }
  end

  def search
    if params.key?(:youtube_id)
      client = Api::YoutubeClient.new

      @playlists = client.search_playlists(params[:youtube_id])
    else
      @playlists = []
    end
  end

  def create
    playlists = params[:playlists].map { |playlist_param|
      playlist = Playlist.build({
        type: "album",
        youtube_playlist_id: playlist_param[:youtube_playlist_id],
        title: playlist_param[:title],
        locale: "ja",
      })

      track_relations = playlist_param[:tracks].map.with_index(1) { |track_param, i|
        artist_param = track_param[:artist]
        track = Track.build({
          youtube_video_id: track_param[:youtube_video_id],
          title: track_param[:title],
          locale: "ja",
          artist: {
            youtube_channel_id: artist_param[:youtube_channel_id],
            name: artist_param[:name],
            locale: "ja",
          },
        })

        track_relation = PlaylistTrack.new(position: track_param[:position])
        track_relation.track = track
        track_relation
      }

      playlist.playlist_tracks = track_relations
      playlist
    }

    playlists.each(&:save!)

    render status: :ok
  end

  def show
    playlist = Playlist.preload(playlist_tracks: :track).find(params[:id])

    @playlist = {
      title: playlist.localized_title("ja"),
      brand: params[:brand],
      tracks: playlist.playlist_tracks.
        map { |playlist_track|
          {
            position: playlist_track.position + 1,
            title: playlist_track.track.localized_title("ja"),
            thumbnail_url: nil,
            artist: playlist_track.track.artist.localized_name("ja"),
          }
        },
    }
  end

  private

  def search_playlists(youtube_id)
    client = Api::YoutubeClient.new

    client.fetch_playlists(youtube_id).
      map { |playlist|
        {
          title: playlist[:title],
          youtube_id: playlist[:id],
          tracks: client.fetch_playlist_items(
            playlist[:id],
            playlist[:item_count],
          ),
        }
      }
  end
end
