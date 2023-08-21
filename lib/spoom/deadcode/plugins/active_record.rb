# typed: strict
# frozen_string_literal: true

module Spoom
  module Deadcode
    module Plugins
      class ActiveRecord < Base
        ignore_methods_named(
          "change",
          "down",
          "up",
          "table_name_prefix",
          "to_param",
        )
      end
    end
  end
end