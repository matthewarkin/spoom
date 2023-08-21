# typed: true
# frozen_string_literal: true

require "test_with_project"
require "helpers/deadcode_helper"

module Spoom
  module Deadcode
    module Plugins
      class ThorTest < TestWithProject
        include Test::Helpers::DeadcodeHelper

        def test_ignore_thor_methods
          @project.write!("foo.rb", <<~RB)
            class Foo < Thor
              class << self
                def exit_on_failure?; end
              end
            end
          RB

          index = index_with_plugins
          assert_ignored(index, "exit_on_failure?")
        end

        private

        sig { returns(Deadcode::Index) }
        def index_with_plugins
          deadcode_index(plugins: [Plugins::Thor.new])
        end
      end
    end
  end
end