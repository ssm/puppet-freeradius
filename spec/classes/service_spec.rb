require 'spec_helper'

describe 'freeradius::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) { { service: 'freeradius' } }

      it { is_expected.to compile }
    end
  end
end
