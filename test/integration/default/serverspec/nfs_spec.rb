require 'serverspec'

# Required by serverspec
set :backend, :exec

# some lines are commented out because docker testing not reflecting full system

describe service('nfs-kernel-server'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
#  it { should be_running }
end

#describe service('nfs'), :if => os[:family] == 'redhat' do
#  it { should be_enabled }
#  it { should be_running }
#end

describe file('/opt/share') do
  it { should be_directory }
  it { should be_owned_by 'nobody' }
end

describe file('/etc/exports') do
  its(:content) { should match /^\/opt\/share 192.168.200.0\/255.255.255.0\(rw\)/ }
end
