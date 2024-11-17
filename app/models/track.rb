class Track < ApplicationRecord
  has_many :translations, class_name: 'Translations::Track'
end
