# frozen_string_literal: true

require "rails_helper"

RSpec.describe Playlist, type: :model do
  describe ".find_or_build_by" do
    let_it_be(:playlist_without_translation_en) {
      create(:playlist, :without_translation_en)
    }

    subject {
      described_class.find_or_build_by(
        params,
        Playlist.types[type.to_sym],
        locale,
      )
    }

    context "with youtube_playlist_id" do
      let(:youtube_playlist_id) { "xxx" }

      context "when the playlist does not exist" do
        let(:title) { "プレイリスト名" }
        let(:type) { "album" }
        let(:locale) { "ja" }

        let(:params) {
          {
            youtube_playlist_id: youtube_playlist_id,
            title: title,
          }
        }

        it {
          expect(subject).to have_attributes(
            id: nil,
            type: type,
            youtube_playlist_id: youtube_playlist_id,
          )
          expect(subject.translations).to contain_exactly(
            have_attributes(
              title: title,
              locale: locale,
            ),
          )
        }
      end

      context "when the playlist exists" do
        context "and locale = 'ja'" do
          let(:title) { "プレイリスト名(変更)" }
          let(:type) { "album" }
          let(:locale) { "ja" }

          let(:params) {
            {
              youtube_playlist_id: playlist_without_translation_en.youtube_playlist_id,
              title: title,
            }
          }

          it {
            expect(subject).to have_attributes(
              id: playlist_without_translation_en.id,
              type: type,
              youtube_playlist_id: playlist_without_translation_en.youtube_playlist_id,
            )
            expect(subject.translations).to contain_exactly(
              have_attributes(
                title: title,
                locale: locale,
              ),
            )
          }
        end

        context "and locale = 'en'" do
          let(:title) { "Playlist Title" }
          let(:type) { "album" }
          let(:locale) { "en" }

          let(:params) {
            {
              youtube_playlist_id: playlist_without_translation_en.youtube_playlist_id,
              title: title,
            }
          }

          it {
            expect(subject).to have_attributes(
              id: playlist_without_translation_en.id,
              type: type,
              youtube_playlist_id: playlist_without_translation_en.youtube_playlist_id,
            )
            expect(subject.translations).to contain_exactly(
              have_attributes(
                title: playlist_without_translation_en.localized_title("ja"),
                locale: "ja",
              ),
              have_attributes(
                title: title,
                locale: locale,
              ),
            )
          }
        end
      end
    end
  end

  describe "#build_playlist_track" do
    let_it_be(:playlist) { create(:playlist, :with_translations) }
    let_it_be(:tracks) {
      [
        create(:track, :with_translations),
        create(:track, :with_translations),
        create(:track, :with_translations),
      ]
    }

    it "should build playlist_track records" do
      tracks.each_with_index do |track, position|
        playlist.build_playlist_track(
          track,
          position + 1,
        )
      end

      expect(playlist.playlist_tracks).to contain_exactly(
        have_attributes(
          position: 1,
          track: tracks[0],
        ),
        have_attributes(
          position: 2,
          track: tracks[1],
        ),
        have_attributes(
          position: 3,
          track: tracks[2],
        ),
      )
    end
  end
end
