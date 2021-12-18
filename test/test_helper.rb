ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  module TestModelValidations
    def self.included(klass)
      klass.class_eval do
        def self.test_validates_presence_of(*attributes)
          attributes.each do |attribute|
            define_method("test_should_require_#{attribute}") do
              model = model_klass.new
              assert_validation(model, attribute, "can't be blank")
            end
          end
        end

        def self.test_validates_uniqueness_of(existing_model, *attributes)
          attributes.each do |attribute|
            define_method("test_should_require_#{attribute}_to_be_unique") do
              params_hash = {}
              params_hash[attribute] = existing_model.send(attribute)
              model = model_klass.new(params_hash)
              assert_validation(model, attribute, 'has already been taken')
            end
          end
        end
        private
        def assert_validation(model, attribute, error_message)
          refute model.valid?
          refute model.save
          assert_operator model.errors.count, :>, 0
          assert model.errors.messages.include?(attribute)
          assert model.errors.messages[attribute].include?(error_message)
        end
      end
    end

    def model_klass
      self.class.name.underscore.split('_test').first.camelize.constantize
    end
  end
end
