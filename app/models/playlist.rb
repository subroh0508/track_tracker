class Playlist < ApplicationRecord
  has_many :translations, class_name: 'Translations::Playlist'
end
