# frozen_string_literal: true

#
# Generate a new Operation and Spec file
#
# Arguments besides `name` are optional
#
# USAGE: be rails g operation name param1 param2
class OperationGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  class_option :params, type: :array, default: []

  def create_operation_file
    # Template method
    # First argument is the name of the template
    # Second argument is where to create the resulting file. In this case, app/operation/my_operation.rb
    template "operation.rb", File.join("app/operations", "#{file_name}.rb")
    template "operation_spec.rb", File.join("spec/operations", "#{file_name}_spec.rb")
  end

  private

  def params
    return "" if options.params.blank?

    "(#{build_params_string})"
  end

  def build_params_string
    options.params.map { |param| param }.join(", ")
  end
end
