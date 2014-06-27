require 'spec_helper'

describe file('/etc/nginx/sites-available/default') do
  it { should be_file }
  its(:content) {
    should match %r{root /usr/share/nginx/grafana}
    should match %r{proxy_pass http://127.0.0.1:9200}
  }
end

describe file('/usr/share/nginx/grafana/config.js') do
  it { should be_file }
  its(:content) {
    should match %r{type: 'influxdb'}
    should match %r{/db/playground}
    should match %r{username: 'admin'}
    should match %r{password: 'admin'}
  }
end
