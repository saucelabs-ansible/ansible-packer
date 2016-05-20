BINARY_PATH = '/usr/local/bin'

describe file("#{BINARY_PATH}/packer") do
  it { should exist.by 'root' }
  it { should be_executable }
  it { should be_owned_by 'root' }
  it { should be_version '0.10.1' }
  its(:mode) { should eq 0755 }
end
