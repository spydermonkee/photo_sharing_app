require 'spec_helper'

describe Post do
  it { should validate_presence_of :title }
  it { should belong_to :user }
  it { should have_attached_file :photo }
end
