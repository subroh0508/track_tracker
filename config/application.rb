require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Workaround: https://github.com/heartcombo/devise/issues/5140#issuecomment-540972293
require "action_mailer/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TrackTracker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Set default locale to Japanese
    config.i18n.default_locale = :ja

    # Whitelist locales available for the application
    config.i18n.available_locales = [:en, :ja]

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.view_component.view_component_path = "app/frontend/components"
    config.eager_load_paths.push(
      Rails.root.join("app", "frontend", "components"),
      Rails.root.join("app", "frontend", "sections"),
    )
    config.view_component.preview_paths.push(
      Rails.root.join("app", "frontend", "components"),
      Rails.root.join("app", "frontend", "sections"),
    )

    config.lookbook.preview_layout = "lookbook/component_preview"
    config.lookbook.preview_display_options = {
      theme: %w[light dark],
    }
  end
end
