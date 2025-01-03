# frozen_string_literal: true

# @logical_path sections/streaming_tracks
class StreamingTracks::SearchFormPreview < ViewComponent::Preview
  def default
    render Tracks::SearchFormComponent.new
  end
end
