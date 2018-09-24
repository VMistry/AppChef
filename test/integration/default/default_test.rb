# # encoding: utf-8

# Inspec test for recipe node::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.

describe service ("nginx") do
  it { should be_running }
  it { should be_enabled }
end

describe port(80) do
  it { should be_listening }
end
