require 'awspec'
require './ec2_helper'

describe vpc('test-vpc') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Name').value('test-vpc') }
  it { should have_tag('Terraform').value('true') }
  it { should have_tag('Environment').value('test') }
  its(:vpc_id) { should eq EC2Helper.GetVPCIdFromName('test-vpc') }
end
