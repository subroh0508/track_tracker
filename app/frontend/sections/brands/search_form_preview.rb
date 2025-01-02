# frozen_string_literal: true

# @logical_path sections/brands
class Brands::SearchFormPreview < ViewComponent::Preview
  def default
    render Brands::SearchFormComponent.new
  end
end
