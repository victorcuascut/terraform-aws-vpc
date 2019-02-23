require 'awspec'
require './ec2_helper'

describe subnet('example-vpc-db-private-us-east-1b') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Environment').value('example-vpc') }
  it { should have_tag('Name').value('example-vpc-db-private-us-east-1b') }
  it { should have_tag('Terraform').value('true') }
end
