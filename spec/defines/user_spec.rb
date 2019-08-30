require 'spec_helper'

describe 'freeradius::user' do
  let(:title) { 'namevar' }
  let(:params) do
    {
      content: <<-EOF
      user "bob" Cleartext-Password == "changeme"
      	Reply-Message := "Hello"
      EOF
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
