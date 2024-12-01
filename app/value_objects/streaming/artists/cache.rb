# frozen_string_literal: true

module Streaming
  module Artists
    class Cache
      def initialize(key, ids)
        @key = key
        @ids = ids
      end

      def exists?(id)
        artists.key?(id)
      end

      def find_by(id)
        artists[id]
      end

      def []=(id, value)
        @artists[id] = value
      end

      private

      attr_reader :key, :ids

      def artists
        @artists ||= Artist.where(key => ids).
          reduce({}) { |acc, artist|
            acc.tap { |o| o[artist.send(key)] = artist }
          }
      end
    end
  end
end
