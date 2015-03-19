def get_scenario_name(scenario)
  scenario.respond_to?('scenario_outline') ? "\"#{scenario.scenario_outline.name}\"" : "\"#{scenario.name}\""
end

Before do |scenario|
  $current_example = scenario.to_hash.symbolize_keys if (scenario.respond_to?(:to_hash))
end

After do |scenario|
  if scenario.failed?
    Cucumber.wants_to_quit = true if should_fail_fast?
    fail("#{scenario} failed.")
  end
  Browser.reset
end

at_exit do
  Browser.close
end
