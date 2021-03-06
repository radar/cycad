require 'dry-validation'

module Cycad
  class Category
    class Validator
      def self.validate(input)
        schema = Dry::Validation.Schema do
          required(:name).filled(:str?, max_size?: 32)
        end

        schema.call(input)
      end
    end
  end
end
