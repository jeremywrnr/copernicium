require_relative 'test_helper'

# test cases for clean() functions
# This function delete all the files in the workspace and create a empty workspace
# The test cases will check if the workspace is empty after calling the clean function

class TestMyWorspaceModule < Minitest::Test
  describe "WorkspaceModule" do
    before "manipulating the workspace" do
      @workspace = Copernicium::Workspace.new()
      @workspace.writeFile("workspace/1.txt","1")
      @workspace.writeFile("workspace/2.txt", "2")
      commInit = parse_command("commit -m 'init commit'".split(" "))
      @workspace.commit(commInit)
    end

    after "manipulating the workspace" do
      FileUtils.rm_rf("workspace")
    end

    #it "can clean the workspace to last commit" do
     # @workspace.writeFile("workspace/1.txt","1_1")
     # @workspace.writeFile("workspace/2.txt", "2_2")
     # 
     # comm = parse_command("clean")

     # @workspace.clean(comm)

     # content = @workspace.readFile("workspace/1.txt")
     # content.must_equal "1"

     # content = @workspace.readFile("workspace/2.txt")
     # content.must_equal "2"
    #end

   # it "can clean specific files in the workspace" do
    #  @workspace.writeFile("workspace/1.txt", "1_1")
    #  comm = parse_command("clean workspace/1.txt")
    #  @workspace.clean(comm)

    #  content = @workspace.readFile("workspace/1.txt")
    #  content.must_equal "1"
    #end

    it "can commit a entire worksapce" do
      @workspace.writeFile("workspace/1.txt","1_1")
      @workspace.writeFile("workspace/2.txt","2_2")
      comm = parse_command("commit -m 'commit entire workspace'".split(" "))
      @workspace.commit(comm)
      comm = parse_command("checkout master".split(" "))
      @workspace.checkout(comm)

      content = @workspace.readFile("workspace/1.txt")
      content.must_equal "1_1"

      content = @workspace.readFile("workspace/2.txt")
      content.must_equal "2_2"
    end

    #it "can commit a list of file" do
     # @workspace.writeFile("workspace/1.txt","1_1_1")
     # comm.files = parse_command("commit -m 'commit one file' workspace/1.txt")
     # @workspace.commit(comm)
     # comm = parse_command("checkout master")
     # @workspace.checkout(comm)

     # content = @workspace.readFile("workspace/1.txt")
     # content.must_equal "1_1_1"
   # end

    it "can checkout a entire branch" do
      @workspace.writeFile("workspace/1.txt","1_1_1_1")
      @workspace.writeFile("workspace/2.txt","2_2_2_2")
      comm = parse_command("commit -m 'commit two files'".split(" "))
      @workspace.commit(comm)
      comm = parse_command("checkout master".split(" "))
      @workspace.checkout(comm)

      content = @workspace.readFile("workspace/1.txt")
      content.must_equal "1_1_1_1"

      content = @workspace.readFile("workspace/2.txt")
      content.must_equal "2_2_2_2"
    end

    it "can checkout a list of files" do
      @workspace.writeFile("workspace/1.txt","none")
      comm = parse_command("checkout master ./workspace/1.txt".split(" "))
      @workspace.checkout(comm)

      content = @workspace.readFile("workspace/1.txt")
      content.must_equal "1"
    end

    it "can check the status of the workspace" do
      File.delete('workspace/2.txt')
      @workspace.writeFile("workspace/1.txt","edit")
      @workspace.writeFile("workspace/3.txt","3")

      changedFiles = @workspace.status(nil)
      changedFiles.must_equal([["./workspace/3.txt"],["./workspace/1.txt"],["./workspace/2.txt"]])
    end
  end
end

