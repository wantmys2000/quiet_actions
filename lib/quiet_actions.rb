require "quiet_actions/version"
require "logger"

module QuietActions
  class Engine < ::Rails::Engine
    config.quiet_actions = true
    config.quiet_action_paths = []

    initializer 'quiet_actions', :after => 'sprockets.environment' do |app|
      next unless app.config.quiet_actions

      KEY = 'quiet_actions.old_level'
      QUIET_ACTIONS = app.config.quiet_action_paths

      Rails::Rack::Logger.class_eval do
        def call_with_quiet_actions(env)
          begin
            if QUIET_ACTIONS.include?(env['PATH_INFO'])
              env[KEY] = Rails.logger.level
              Rails.logger.level = Logger::ERROR
            end
            call_without_quiet_actions(env)
          ensure
            Rails.logger.level = env[KEY] if env[KEY]
          end
        end
        alias_method_chain :call, :quiet_actions
      end
    end
  end
end
