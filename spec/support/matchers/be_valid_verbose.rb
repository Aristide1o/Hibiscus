RSpec::Matchers.define :be_valid_verbose do
  match do |model|
    model.valid?
  end

  failure_message_for_should do |model|
    "#{model.class} expected to be valid but had errors: \n\t#{model.errors.full_messages.join("\n\t")}"
  end

  failure_message_for_should_not do |model|
    "#{model.class} expected to have errors, but it did not"
  end

  description do
    "be valid"
  end
end