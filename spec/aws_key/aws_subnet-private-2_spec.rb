require 'awspec'
require './ec2_helper'

describe subnet('example-vpc-elb-private-us-east-1c') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Environment').value('example-vpc') }
  it { should have_tag('Name').value('example-vpc-elb-private-us-east-1c') }
  it { should have_tag('Terraform').value('true') }
end
