BINARY_PATH = '/usr/local/bin'

describe file("#{BINARY_PATH}/packer") do
  it { should exist }
  it { should be_owned_by 'root' }
  its(:mode) { should eq 0755 }
end

describe file("#{BINARY_PATH}/packer-builder-lxc") do
  it { should exist }
  it { should be_owned_by 'root' }
  its(:mode) { should eq 0755 }
end

describe file("#{BINARY_PATH}/packer-provisioner-host-command") do
  it { should exist }
  it { should be_owned_by 'root' }
  its(:mode) { should eq 0755 }
end

describe command('packer') do
  it { should exist }
end

describe command('packer --version') do
  its('stdout') { should match /0\.10\.1/ }
end
