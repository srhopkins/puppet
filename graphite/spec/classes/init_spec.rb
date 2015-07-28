require 'spec_helper'
describe 'graphite_centos7' do

  context 'with defaults for all parameters' do
    it { should contain_class('graphite_centos7') }
  end
end
