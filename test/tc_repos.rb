# Logan Gittelson

require_relative 'test_helper'

include Copernicium::Repos

class TestCnReposModule < Minitest::Test
  describe 'ReposModule' do
    before 'mixin repo module and create file objects' do
      Repos.setup_tester
      @file1 = FileObj.new('file1', [1, 2])
      @file2 = FileObj.new('file2', [3, 4])
      @file3 = FileObj.new('file3', [5, 6])
    end

    after "clean up repo dir" do
      FileUtils.rm_rf(File.join(Dir.pwd, ".cn"))
    end

    it 'can create snapshots' do
      Repos.make_snapshot([@file1, @file2]).wont_be_nil
      Repos.history.wont_be_empty
    end

    # todo - fix this, important
    it 'can get a snapshot from an id' do
      @files = [@file1, @file2]
      snapid = Repos.make_snapshot @files
      puts snapid
      snap = Repos.get_snapshot snapid
      snap.id.must_equal snapid
      snap.files.must_equal @files
    end

    it 'can parse history' do
      snap1 = Repos.make_snapshot [@file1, @file2]
      snap2 = Repos.make_snapshot [@file1, @file2, @file3]
      snap3 = Repos.make_snapshot [@file1, @file3]
      Repos.history.must_equal [snap1, snap2, snap3]
    end

    it 'can delete snapshots' do
      snap1 = Repos.make_snapshot [@file1, @file2]
      snap2 = Repos.make_snapshot [@file1, @file2, @file3]
      snap3 = Repos.make_snapshot [@file1, @file3]
      Repos.history.must_equal [snap1, snap2, snap3]
      Repos.delete_snapshot snap1
      Repos.history.must_equal [snap2, snap3]
    end

    it 'can diff snapshots' do
      snap1 = Repos.make_snapshot [@file1, @file2, @file3]
      snap2 = Repos.make_snapshot [@file1, @file3]
      Repos.diff_snapshots(snap1, snap1) #todo - fix
    end

    it 'can create branches' do
      Repos.make_branch 'hello'
      Repos.make_branch 'world'
    end

    it 'can create and show off branches' do
      tester = ['master', 'hello', 'world']
      Repos.make_branch 'hello'
      Repos.make_branch 'world'
      Repos.branches.must_equal tester
    end

    it 'can switch between branches' do
      current = @@branch
      current.must_equal 'master'
      Repos.make_branch 'hello'
      Repos.update_branch 'hello'
      newer = @@branch
      newer.must_equal 'hello'
    end

    it 'can delete branchs' do
      tester = ['hello', 'world']
      Repos.make_branch 'hello'
      Repos.make_branch 'world'
      Repos.delete_branch 'master'
      Repos.branches.must_equal tester
    end

    it 'can merge branches' do
      current = @@branch
      current.must_equal 'master'
      Repos.make_branch 'hello'
      Repos.update_branch 'hello'
      newer = @@branch
      newer.must_equal 'hello'
    end
  end
end

