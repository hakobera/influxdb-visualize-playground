describe file('/etc/supervisor/conf.d/influga.conf') do
  it { should be_file }
  its(:content) { should match %r{[program:influga]} }
end
