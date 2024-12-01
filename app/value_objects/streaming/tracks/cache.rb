# frozen_string_literal: true

module Streaming
  module Tracks
    class Cache
      def initialize(key, ids)
        @key = key
        @ids = ids
      end

      def exists?(id)
        tracks.key?(id)
      end

      def find_by(id)
        tracks[id]
      end

      def []=(id, value)
        @tracks[id] = value
      end

      private

      attr_reader :key, :ids

      def tracks
        @tracks ||= Track.where(key => ids).
          reduce({}) { |acc, track|
            acc.tap { |o| o[track.send(key)] = track }
          }
      end
    end
  end
end
