require 'spec_helper'

describe 'freeradius::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) do
        {
          config_dir: '/etc/raddb',
          config_owner: 'root',
          config_group: 'radiusd',
          config_mode: '0640',
          users: {
            bob: {
              content: <<-EOF
              bob    Cleartext-Password := "hello"
                Reply-Message := "Hello, %{User-Name}"
              EOF
            },
          },
        }
      end

      it { is_expected.to compile }

      it { is_expected.to contain_concat('/etc/raddb/mods-config/files/authorize') }

      it {
        is_expected.to contain_concat__fragment('bob')
          .with_target('/etc/raddb/mods-config/files/authorize')
      }
    end
  end
end
