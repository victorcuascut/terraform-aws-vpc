require 'awspec'
require './ec2_helper'

describe subnet('test-vpc-private-us-east-1a') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Environment').value('test') }
  it { should have_tag('Name').value('test-vpc-private-us-east-1a') }
  it { should have_tag('Terraform').value('true') }
end
