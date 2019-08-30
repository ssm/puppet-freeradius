require 'spec_helper'

describe 'freeradius::client' do
  let(:title) { 'namevar' }
  let(:params) do
    { client: 'box',
      attributes: { ipaddr: '2001:db8::/64', secret: 'changeme' } }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it {
        is_expected.to contain_concat__fragment('box')
          .with_target(%r{^/.*/clients.conf$})
          .with_content(%r{secret = changeme})
      }
    end
  end
end
