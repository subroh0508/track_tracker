class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all.map { |playlist|
      {
        youtube_id: playlist.youtube_id,
        title: playlist.localized_title("ja"),
        tracks: playlist.tracks.map { |track|
          {
            id: track.id,
            title: track.localized_title("ja"),
          }
        },
      }
    }
  end

  def search
    if params.key?(:youtube_id)
      @playlists = search_playlists(params[:youtube_id])
    else
      @playlists = []
    end
  end

  def create
    playlists = params[:playlists].map { |playlist_param|
      playlist = Playlist.build({
        type: "album",
        youtube_id: playlist_param[:id],
        title: playlist_param[:title],
        locale: "ja",
      })

      track_relations = playlist_param[:tracks].map.with_index(1) { |track_param, i|
        track = Track.build({
          youtube_id: track_param[:id],
          title: track_param[:title],
          locale: "ja",
        })

        track_relation = PlaylistTrack.new(sort: i)
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
    playlist = Playlist.find(params[:id])

    @playlist = {
      title: playlist.localized_title("ja"),
      youtube_id: playlist.youtube_id,
    }
  end

  private

  def search_playlists(youtube_id)
    playlist_client = Api::Youtube::Playlist.new
    playlist_item_client = Api::Youtube::PlaylistItem.new

    playlist_client.fetch(youtube_id).
      map { |playlist|
        {
          title: playlist[:title],
          youtube_id: playlist[:id],
          tracks: playlist_item_client.fetch(
            playlist[:id],
            playlist[:item_count],
          ),
        }
      }
  end
end
