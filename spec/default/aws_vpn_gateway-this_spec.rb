require 'awspec'
require './ec2_helper'

describe vpn_gateway('test-vpc') do
  it { should exist }
  it { should be_available }
  its(:type) {should eq 'ipsec.1'}
  it { should have_tag('Environment').value('test') }
  it { should have_tag('Name').value('test-vpc') }
  it { should have_tag('Terraform').value('true') }
  its(:vpn_gateway_id) { should eq EC2Helper.GetVPNGWIdFromName('test-vpc') }
end
