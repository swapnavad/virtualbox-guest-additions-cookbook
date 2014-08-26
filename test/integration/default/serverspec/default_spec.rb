#
# Cookbook Name:: virtualbox-guest-additions
# Serverspec:: default
#
# Copyright (C) 2014 Patrick Ayoup
#
# MIT License
#

require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe command('lsmod | grep -i vbox') do
  it { should return_exit_status 0 }
  its(:stdout) { should match /vboxsf/ }
  its(:stdout) { should match /vboxguest/ }
  its(:stdout) { should match /vboxvideo/ }
  its(:stdout) { should match /drm/ }
end
