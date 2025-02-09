# frozen_string_literal: true

# @logical_path sections/root
class Root::NavbarPreview < ViewComponent::Preview
  def default
    render Root::NavbarComponent.new(
      menus: [
        {
          href: "/playlists",
          label: "プレイリスト一覧",
          is_active: false,
        },
        {
          href: "/streaming_tracks/register",
          label: "楽曲登録",
          is_active: true,
        },
        {
          href: "/settings",
          label: "設定",
          is_active: false,
        },
      ],
    )
  end
end
