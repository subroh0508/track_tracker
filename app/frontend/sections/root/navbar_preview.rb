# frozen_string_literal: true

# @logical_path sections/root
class Root::NavbarPreview < ViewComponent::Preview
  def default
    render Root::NavbarComponent.new(
      root_path: "http://localhost:3000",
      menus: [
        {
          href: "/playlists",
          label: "プレイリスト一覧",
          is_active: false,
        },
        {
          href: "/albums/search",
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
