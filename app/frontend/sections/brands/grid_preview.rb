# frozen_string_literal: true

# @logical_path sections/brands
class Brands::GridPreview < ViewComponent::Preview
  def default
    render Brands::GridComponent.new(
      items: [
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          year: 2011,
          artist: "supercell",
        },
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
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
          thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          year: 2011,
          artist: "supercell",
        },
        {
          thumbnail_url: "https://i.scdn.co/image/ab67616d00001e027de4dbffeda7b3ab5a2e5c77",
          title: "Today Is A Beautiful Day",
          year: 2011,
          artist: "supercell",
        },
      ],
    )
  end
end
