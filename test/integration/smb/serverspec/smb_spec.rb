require 'serverspec'

# Required by serverspec
set :backend, :exec

# some lines are commented out (or only ubuntu) because docker testing not reflecting full system

describe service('smbd'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end
describe service('nmbd'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end
#describe service('smb'), :if => os[:family] == 'redhat' do
#  it { should be_enabled }
#  it { should be_running }
#end
#describe service('nmb'), :if => os[:family] == 'redhat' do
#  it { should be_enabled }
#  it { should be_running }
#end


describe process("smbd"), :if => os[:family] == 'ubuntu' do
  its(:user) { should eq "root" }
#  its(:args) { should match /-D/ }
#  its(:args) { should match /-F/ } on trusty???
end
describe process("nmbd"), :if => os[:family] == 'ubuntu' do
  its(:user) { should eq "root" }
## no argument on centos
  its(:args) { should match /-D/ }
end

describe port(445), :if => os[:family] == 'ubuntu' do
  it { should be_listening }
end

describe file('/share') do
  it { should be_directory }
  it { should be_owned_by 'nobody' }
end

describe file('/etc/samba/smb.conf') do
  its(:content) { should match /^\[share\]/ }
end
