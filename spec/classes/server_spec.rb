require 'spec_helper'

describe 'csync2' do
	let (:facts) { {
		:osfamily	=> 'Debian'
	}}
		
	context "basic tests" do
		it { should contain_class('csync2') }
		it { should contain_package('csync2').with( :ensure => 'present' ) }
        it { should contain_file('/etc/csync2.cfg').with(
                :owner  => 'root',
                :group  => 'root',
                :mode   => '0644'
           )}
        it { should contain_file('/etc/csync2.key').with(
                :owner  => 'root',
                :group  => 'root',
                :mode   => '0600'
           )}
    end
end
