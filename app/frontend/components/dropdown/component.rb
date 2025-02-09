# frozen_string_literal: true

module Dropdown
  class Component < ViewComponent::Base
    renders_one :button
    renders_many :items
  end
end
