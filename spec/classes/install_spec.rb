require 'spec_helper'

describe 'freeradius::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) { { packages: ['freeradius', 'freeradius-utils'] } }

      it { is_expected.to compile }
    end
  end
end
