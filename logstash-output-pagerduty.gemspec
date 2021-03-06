Gem::Specification.new do |s|

  s.name            = 'logstash-output-pagerduty'
  s.version         = '3.0.9'
  s.licenses        = ['Apache License (2.0)']
  s.summary         = "Sends notifications based on preconfigured services and escalation policies"
  s.description     = "This gem is a Logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/logstash-plugin install gemname. This gem is not a stand-alone program"
  s.authors         = ["Elastic"]
  s.email           = 'info@elastic.co'
  s.homepage        = "http://www.elastic.co/guide/en/logstash/current/index.html"
  s.require_paths = ["lib"]

  # Files
  s.files = Dir["lib/**/*","spec/**/*","*.gemspec","*.md","CONTRIBUTORS","Gemfile","LICENSE","NOTICE.TXT", "vendor/jar-dependencies/**/*.jar", "vendor/jar-dependencies/**/*.rb", "VERSION", "docs/**/*"]

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "output" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", ">= 1.60", "<= 2.99"
  s.add_runtime_dependency 'logstash-codec-plain'

  s.add_development_dependency 'logstash-devutils'

  # Webmock 3.x requires Ruby >= 2.0, but Logstash 5.x still runs Ruby in 1.9-mode.
  # Select the 3.x series where compatible, and fall back to webmock 2.2.x when necessary
  s.add_development_dependency 'webmock', '>=2.2.0', '< 4.0.0'
end

