var search_data = {"index":{"searchIndex":["copernicium","driver","fileobj","pushpull","repos","revlog","snapshot","uicomm","workspace","object","==()","add_file()","checkout()","checkout()","clean()","clear()","clone()","clone()","commit()","commit()","connect()","default_hash_factory()","delete_branch()","delete_file()","delete_snapshot()","diff_files()","diff_snapshots()","fetch()","get()","get_file()","get_files()","get_id()","get_snapshot()","hash_file()","history()","history()","include?()","indexof()","init()","make_branch()","make_snapshot()","manifest()","merge()","merge()","new()","new()","new()","new()","new()","new()","pexit()","pull()","pull()","push()","push()","readfile()","restore_snapshot()","run()","set_id()","status()","status()","transfer()","update_log_file()","writefile()","readme"],"longSearchIndex":["copernicium","copernicium::driver","copernicium::fileobj","copernicium::pushpull","copernicium::repos","copernicium::revlog","copernicium::snapshot","copernicium::uicomm","copernicium::workspace","object","copernicium::fileobj#==()","copernicium::revlog#add_file()","copernicium::driver#checkout()","copernicium::workspace#checkout()","copernicium::workspace#clean()","copernicium::repos#clear()","copernicium::driver#clone()","copernicium::pushpull#clone()","copernicium::driver#commit()","copernicium::workspace#commit()","copernicium::pushpull#connect()","copernicium::revlog#default_hash_factory()","copernicium::repos#delete_branch()","copernicium::revlog#delete_file()","copernicium::repos#delete_snapshot()","copernicium::revlog#diff_files()","copernicium::repos#diff_snapshots()","copernicium::pushpull#fetch()","copernicium::driver#get()","copernicium::revlog#get_file()","copernicium::snapshot#get_files()","copernicium::snapshot#get_id()","copernicium::repos#get_snapshot()","copernicium::revlog#hash_file()","copernicium::repos#history()","copernicium::revlog#history()","copernicium::workspace#include?()","copernicium::workspace#indexof()","copernicium::driver#init()","copernicium::repos#make_branch()","copernicium::repos#make_snapshot()","copernicium::repos#manifest()","copernicium::driver#merge()","copernicium::revlog#merge()","copernicium::fileobj::new()","copernicium::repos::new()","copernicium::revlog::new()","copernicium::snapshot::new()","copernicium::uicomm::new()","copernicium::workspace::new()","copernicium::driver#pexit()","copernicium::driver#pull()","copernicium::pushpull#pull()","copernicium::driver#push()","copernicium::pushpull#push()","copernicium::workspace#readfile()","copernicium::repos#restore_snapshot()","copernicium::driver#run()","copernicium::snapshot#set_id()","copernicium::driver#status()","copernicium::workspace#status()","copernicium::pushpull#transfer()","copernicium::revlog#update_log_file()","copernicium::workspace#writefile()",""],"info":[["Copernicium","","Copernicium.html","","<p>Revlog Top Level Function Definitions (Xiangru)\n<p>add_file: add a file to the revision history in - file …\n"],["Copernicium::Driver","","Copernicium/Driver.html","",""],["Copernicium::FileObj","","Copernicium/FileObj.html","",""],["Copernicium::PushPull","","Copernicium/PushPull.html","",""],["Copernicium::Repos","","Copernicium/Repos.html","",""],["Copernicium::RevLog","","Copernicium/RevLog.html","",""],["Copernicium::Snapshot","","Copernicium/Snapshot.html","",""],["Copernicium::UIComm","","Copernicium/UIComm.html","","<p>Communication object that will pass commands to backend modules rev - A\nsingle revision indicator (commit …\n"],["Copernicium::Workspace","","Copernicium/Workspace.html","",""],["Object","","Object.html","",""],["==","Copernicium::FileObj","Copernicium/FileObj.html#method-i-3D-3D","(rhs)",""],["add_file","Copernicium::RevLog","Copernicium/RevLog.html#method-i-add_file","(file_name, content)",""],["checkout","Copernicium::Driver","Copernicium/Driver.html#method-i-checkout","(args)",""],["checkout","Copernicium::Workspace","Copernicium/Workspace.html#method-i-checkout","(comm)",""],["clean","Copernicium::Workspace","Copernicium/Workspace.html#method-i-clean","(comm)","<p>if list_files is nil, then rollback the list of files from the branch or\nrollback to the entire branch …\n"],["clear","Copernicium::Repos","Copernicium/Repos.html#method-i-clear","()",""],["clone","Copernicium::Driver","Copernicium/Driver.html#method-i-clone","(args)",""],["clone","Copernicium::PushPull","Copernicium/PushPull.html#method-i-clone","(remote, dir, user = nil, passwd = nil)",""],["commit","Copernicium::Driver","Copernicium/Driver.html#method-i-commit","(args)",""],["commit","Copernicium::Workspace","Copernicium/Workspace.html#method-i-commit","(comm)","<p>commit a list of files or the entire workspace to make a new snapshot\n"],["connect","Copernicium::PushPull","Copernicium/PushPull.html#method-i-connect","(remote, user = nil, passwd = nil, &block)",""],["default_hash_factory","Copernicium::RevLog","Copernicium/RevLog.html#method-i-default_hash_factory","()",""],["delete_branch","Copernicium::Repos","Copernicium/Repos.html#method-i-delete_branch","(branch_name)",""],["delete_file","Copernicium::RevLog","Copernicium/RevLog.html#method-i-delete_file","(file_id)","<p>return 1 if succeed, otherwise 0\n"],["delete_snapshot","Copernicium::Repos","Copernicium/Repos.html#method-i-delete_snapshot","(target_id)",""],["diff_files","Copernicium::RevLog","Copernicium/RevLog.html#method-i-diff_files","(file_id1, file_id2)",""],["diff_snapshots","Copernicium::Repos","Copernicium/Repos.html#method-i-diff_snapshots","(id1, id2)","<p>Finds the files in snap1 that aren&#39;t in snap2, change this? Consider\nusing diffy?\n"],["fetch","Copernicium::PushPull","Copernicium/PushPull.html#method-i-fetch","(remote, dest, local, user = nil, passwd = nil)",""],["get","Copernicium::Driver","Copernicium/Driver.html#method-i-get","(info)","<p>Get some info from the user when they dont specify it\n"],["get_file","Copernicium::RevLog","Copernicium/RevLog.html#method-i-get_file","(file_id)",""],["get_files","Copernicium::Snapshot","Copernicium/Snapshot.html#method-i-get_files","()",""],["get_id","Copernicium::Snapshot","Copernicium/Snapshot.html#method-i-get_id","()","<p>drop get prefix?\n"],["get_snapshot","Copernicium::Repos","Copernicium/Repos.html#method-i-get_snapshot","(target_id)",""],["hash_file","Copernicium::RevLog","Copernicium/RevLog.html#method-i-hash_file","(file_name, content)",""],["history","Copernicium::Repos","Copernicium/Repos.html#method-i-history","()","<p>def history(branch_name)\n"],["history","Copernicium::RevLog","Copernicium/RevLog.html#method-i-history","(file_name)",""],["include?","Copernicium::Workspace","Copernicium/Workspace.html#method-i-include-3F","(list_files)","<p>if include all the elements in list_files\n"],["indexOf","Copernicium::Workspace","Copernicium/Workspace.html#method-i-indexOf","(x)",""],["init","Copernicium::Driver","Copernicium/Driver.html#method-i-init","(args)",""],["make_branch","Copernicium::Repos","Copernicium/Repos.html#method-i-make_branch","(branch_name)",""],["make_snapshot","Copernicium::Repos","Copernicium/Repos.html#method-i-make_snapshot","(file_array)",""],["manifest","Copernicium::Repos","Copernicium/Repos.html#method-i-manifest","()",""],["merge","Copernicium::Driver","Copernicium/Driver.html#method-i-merge","(args)",""],["merge","Copernicium::RevLog","Copernicium/RevLog.html#method-i-merge","(file_id1, file_id2)",""],["new","Copernicium::FileObj","Copernicium/FileObj.html#method-c-new","(path, ids)",""],["new","Copernicium::Repos","Copernicium/Repos.html#method-c-new","()",""],["new","Copernicium::RevLog","Copernicium/RevLog.html#method-c-new","(project_path)",""],["new","Copernicium::Snapshot","Copernicium/Snapshot.html#method-c-new","(in_array)",""],["new","Copernicium::UIComm","Copernicium/UIComm.html#method-c-new","(command: nil, files: nil, rev: nil, commit_message: nil, repo: nil, opts: nil)",""],["new","Copernicium::Workspace","Copernicium/Workspace.html#method-c-new","(bname = 'master', rootdir = './workspace')","<p>private_class_method :writeFile private_class_method :readFile\n"],["pexit","Copernicium::Driver","Copernicium/Driver.html#method-i-pexit","(msg, sig)","<p>Print and exit with a specific code\n"],["pull","Copernicium::Driver","Copernicium/Driver.html#method-i-pull","(args)",""],["pull","Copernicium::PushPull","Copernicium/PushPull.html#method-i-pull","(remote, branch, remote_dir)",""],["push","Copernicium::Driver","Copernicium/Driver.html#method-i-push","(args)",""],["push","Copernicium::PushPull","Copernicium/PushPull.html#method-i-push","(remote, branch, remote_dir)",""],["readFile","Copernicium::Workspace","Copernicium/Workspace.html#method-i-readFile","(path)",""],["restore_snapshot","Copernicium::Repos","Copernicium/Repos.html#method-i-restore_snapshot","(target_id)","<p>Not sure how I&#39;m gonna do this one\n"],["run","Copernicium::Driver","Copernicium/Driver.html#method-i-run","(args)","<p>Executes the required action for a given user command.\n<p>Parameters:\n\n<pre>* args - an array containing the tokenized ...</pre>\n"],["set_id","Copernicium::Snapshot","Copernicium/Snapshot.html#method-i-set_id","(in_id)",""],["status","Copernicium::Driver","Copernicium/Driver.html#method-i-status","(args)",""],["status","Copernicium::Workspace","Copernicium/Workspace.html#method-i-status","(comm)",""],["transfer","Copernicium::PushPull","Copernicium/PushPull.html#method-i-transfer","(remote, local, dest, user = nil, passwd = nil)",""],["update_log_file","Copernicium::RevLog","Copernicium/RevLog.html#method-i-update_log_file","()",""],["writeFile","Copernicium::Workspace","Copernicium/Workspace.html#method-i-writeFile","(path, content)",""],["README","","README_md.html","","<p>copernicium\n<p><img src=\"https://badge.fury.io/rb/copernicium.svg\">\n<img\nsrc=\"https://travis-ci.org/jeremywrnr/copernicium.svg\"> ...\n"]]}}