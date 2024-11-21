# frozen_string_literal: true

# @logical_path components
class SearchInput::Preview < ViewComponent::Preview
  def default
    render SearchInput::Component.new(
      id: "default-search",
      label: "Search",
      placeholder: "Search track...",
      classes: "max-w-sm mx-auto",
    )
  end
end
