# frozen_string_literal: true

# @logical_path sections/albums
class Albums::GridPreview < ViewComponent::Preview
  def default
    render Albums::GridComponent.new(
      items: [
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d0000b2737de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          year: 2011,
          artist: "supercell",
        },
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d0000b2737de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          year: 2011,
          artist: "supercell",
        },
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d0000b2737de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          year: 2011,
          artist: "supercell",
        },
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d0000b2737de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          year: 2011,
          artist: "supercell",
        },
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d0000b2737de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          year: 2011,
          artist: "supercell",
        },
      ],
    )
  end
end
