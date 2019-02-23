require 'awspec'
require './ec2_helper'

describe vpc('example-vpc') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Environment').value('example-vpc') }
  it { should have_tag('Name').value('example-vpc') }
  it { should have_tag('Terraform').value('true') }
  its(:vpc_id) { should eq EC2Helper.GetVPCIdFromName('example-vpc') }
  its('Assigned IGW count'){ expect(EC2Helper.GetIGWsCountForVPCwithName('example-vpc')).to eq 0 }
end
