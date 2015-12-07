# workspace module tests

require_relative 'test_helper'

include Copernicium::Workspace

class CoperniciumWorkspaceTest < Minitest::Test
  describe 'WorkspaceModule' do
    before 'manipulating the workspace, make a cn repo' do
      Dir.mkdir('workspace')
      Dir.chdir('workspace')
      File.write('1.txt', '1')
      File.write('2.txt', '2')
      Workspace.create_project
      Workspace.setup # requiring revlog and repos here, cn init
      @init = Workspace.commit(UIComm.new(files: ['1.txt', '2.txt']))
    end

    after 'manipulating the workspace, clean cn folder' do
      Dir.chdir(File.join(Dir.pwd, '..'))
      FileUtils.rm_rf('workspace')
    end

    it 'can commit a entire workspace' do
      File.write('1.txt','1_1')
      File.write('2.txt','2_2')
      Workspace.commit(UIComm.new(files: ['1.txt', '2.txt']))
      File.read('1.txt').must_equal '1_1'
      File.read('2.txt').must_equal '2_2'
    end

    it 'can checkout a entire branch' do
      File.write('1.txt', '1_1_1_1')
      File.write('2.txt', '2_2_2_2')
      Workspace.commit(UIComm.new(files: ['1.txt', '2.txt']))

      # todo - actually switch branches
      Workspace.checkout(UIComm.new(rev: 'master'))

      File.read('1.txt').must_equal '1_1_1_1'
      File.read('2.txt').must_equal '2_2_2_2'
    end

    it 'can check the status of the workspace' do
      File.delete('2.txt')
      File.write('1.txt', 'edit')
      File.write('3.txt', '3')
      Workspace.status.must_equal([['./3.txt'], ['./1.txt'],['./2.txt']])
    end

    it 'can clean the workspace to last commit' do
      File.write('1.txt', '1_1')
      File.write('2.txt', '2_2')
      Workspace.clean
      File.read('1.txt').must_equal '1'
      File.read('2.txt').must_equal '2'
    end

    it 'can clean the workspace to a specific commit' do
      File.write('1.txt', '1_1')
      File.write('2.txt', '2_2')
      Workspace.clean(@first)
      File.read('1.txt').must_equal '1'
      File.read('2.txt').must_equal '2'
    end

    it 'can clean specific files in the workspace' do
      File.write('1.txt', '1_1')
      Workspace.clean(UIComm.new('clean', files: ['1.txt']))
      File.read('1.txt').must_equal '1'
    end

    it 'can commit a list of files' do
      File.write('1.txt', '1_1_1')
      Workspace.commit(UIComm.new(files: ['1.txt']))
      File.read('1.txt').must_equal '1_1_1'
    end

    it 'can checkout a list of files' do
      File.write('1.txt','none')
      Workspace.checkout UIComm.new(files: ['1.txt'])
      File.read('1.txt').must_equal '1'
    end
  end
end

