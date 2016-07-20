require 'spec_helper'
describe 'profile' do
  on_supported_os({
    supported_os: [
      {
        'operatingsystem' => 'CentOS',
        'operatingsystemrelease' => [
          '5',
          '6',
          '7'
        ]
      }
    ]
  }).each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          puppetversion: Puppet.version,
          sudoversion: '1.7.10p9',
          role: 'artifactory'
        })
      end
      it { is_expected.to compile }
    end
  end
end
