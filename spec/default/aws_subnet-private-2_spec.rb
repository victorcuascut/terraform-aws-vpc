require 'awspec'
require './ec2_helper'

describe subnet('test-vpc-private-us-east-1c') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Name').value('test-vpc-private-us-east-1c') }
  it { should have_tag('Terraform').value('true') }
  it { should have_tag('Environment').value('test') }
end
