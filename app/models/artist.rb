# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :translations, class_name: "Translations::Artist"
  has_many :tracks
end
