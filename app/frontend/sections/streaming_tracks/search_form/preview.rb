# frozen_string_literal: true

# @logical_path sections/streaming_tracks/search_form
class StreamingTracks::SearchForm::Preview < ViewComponent::Preview
  def default
    render StreamingTracks::SearchForm::Component.new
  end
end
