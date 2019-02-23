require 'awspec'
require './ec2_helper'

describe subnet('test-vpc-public-us-east-1b') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Environment').value('test') }
  it { should have_tag('Name').value('test-vpc-public-us-east-1b') }
  it { should have_tag('Terraform').value('true') }
end
