# frozen_string_literal: true

require "rails_helper"

RSpec.describe Track, type: :model do
  let_it_be(:track_without_translation_en) {
    create(:track, :without_translation_en)
  }

  describe ".find_or_build_by" do
    subject { described_class.find_or_build_by(params, locale) }

    context "with youtube_video_id" do
      let(:youtube_video_id) { "xxx" }

      context "when the track does not exist" do
        let(:title) { "曲名" }
        let(:locale) { "ja" }

        let(:params) {
          {
            youtube_video_id: youtube_video_id,
            title: title,
          }
        }

        it {
          expect(subject).to have_attributes(
            id: nil,
            youtube_video_id: youtube_video_id,
            artist: nil,
          )
          expect(subject.translations).to contain_exactly(
            have_attributes(
              title: title,
              locale: locale,
            ),
          )
        }
      end

      context "when the track exists" do
        context "and locale = 'ja'" do
          let(:title) { "曲名(変更)" }
          let(:locale) { "ja" }

          let(:params) {
            {
              youtube_video_id: track_without_translation_en.youtube_video_id,
              title: title,
            }
          }

          it {
            expect(subject).to have_attributes(
              id: track_without_translation_en.id,
              youtube_video_id: track_without_translation_en.youtube_video_id,
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
          let(:title) { "Track Title" }
          let(:locale) { "en" }

          let(:params) {
            {
              youtube_video_id: track_without_translation_en.youtube_video_id,
              title: title,
            }
          }

          it {
            expect(subject).to have_attributes(
              id: track_without_translation_en.id,
              youtube_video_id: track_without_translation_en.youtube_video_id,
              artist: be_present,
            )
            expect(subject.translations).to contain_exactly(
              have_attributes(
                title: track_without_translation_en.localized_title("ja"),
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
end
