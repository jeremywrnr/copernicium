# Frank Tamburrino
# CSC 253
# Unit Tests for Push and Pull
# October 15, 2015

require_relative 'test_helper'

include Copernicium::PushPull

class TestPushPullModule < Minitest::Test
  describe 'Copernicium PushPull' do
    before 'connecting to host, define constants' do
      @host = 'cycle2.csug.rochester.edu'
    end

    # test for a good connection and a bad connection
    it 'is able to connect to a remote computer' do
      conn = PushPull.connect(@host, @user)
      conn.must_equal true

      conn = PushPull.connect('null@cif.rochester.edu', @user)
      conn.must_equal false
    end

    it 'can yield a remote connection to a block' do
      test = Object.new
      conn = PushPull.connect(@host, @user) do |x|
        test = (x.exec!('echo Blocks Working!')).strip;
      end
      test.must_equal 'Blocks Working!'
    end

    it 'can move files to remote servers for push' do
      tfile = File.new('comm_t.copernicium', 'w')
      tfile.close
      test = PushPull.transfer(@host, './comm_t.copernicium', '/localdisk/comm_t.copernicium', @user) do |scp|
        scp.upload!('./comm_t.copernicium', '/localdisk/comm_t.copernicium', :recursive => true)
      end
      File.delete('comm_t.copernicium')
      PushPull.connect(@host, @user) do |x|
        x.exec!('ls /localdisk/comm_t.copernicium')
        x.exec!('rm /localdisk/comm_t.copernicium')
      end
      test.must_equal true
    end

    it 'can fetch files from a server for pull' do
      PushPull.connect(@host, @user) do |x|
        x.exec!('touch /localdisk/comm_t.copernicium')
      end
      result = PushPull.fetch(@host, '/localdisk/comm_t.copernicium', './', @user)
      File.delete('./comm_t.copernicium')
      result.must_equal true
    end

    it 'can clone a repository from a server' do
      conn = PushPull.connect(@host, @user) do |x|
        x.exec!('mkdir /localdisk/.t_copernicium')
        x.exec!('touch /localdisk/.t_copernicium/comm_t.copernicium');
      end
      result = PushPull.clone('cycle2.csug.rochester.edu:/localdisk/.t_copernicium', @user)
      conn = PushPull.connect(@host, @user) do |x|
        x.exec!('rm -r .t_copernicium')
      end
      result.must_equal true
    end
  end
end

