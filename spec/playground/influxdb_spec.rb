require 'spec_helper'

describe package('influxdb') do
  it { should be_installed }
end

describe service('influxdb') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8083) do
  it { should be_listening }
end

describe port(8086) do
  it { should be_listening }
end

describe file('/opt/influxdb/shared/config.toml') do
  it { should be_file }
end
