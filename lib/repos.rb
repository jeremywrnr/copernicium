# repos module

require 'digest'
#require 'marshal'

# Details from this link:
#   https://docs.google.com/document/d/1r3-NquhyRLbCncqTOQPwsznSZ-en6G6xzLbWIAmxhys/edit#heading=h.7pyingf1unu


# Repos Top Level Function Definitions (Logan)

# make_snapshot: Creates new snapshot from current files and versions
#   in - array of file objects. file object = array of all versions: {id, content}
#   out - hash id of snapshot 

# restore_snapshot: Set current file versions to specified snapshot
#   in - id of target snapshot
#   out - Comm object with status

# history: Returns ids for all snapshots
#   in - branch name
#   out - Array of snapshot ids

# delete_snapshot: delete specified a snapshot
#   in - target snapshot
#   out -  Comm object with status

# diff_snapshots: Returns diff between two different snapshots 
#   in - two ids of snapshots to perform diff on
#   out - list of filenames and versions

# make_branch: make a new branch
#   in - branch name
#   out - hash id of new branch

# delete_branch: delete a branch
#   in - branch name
#   out - exit status code

# Also do a get_snapshot

module Copernicium
  class Snapshot
    def initialize(in_array)
      @files = in_array
      @id = ""
      # id = hash of in array?
    end
    
    def set_id(in_id)
      @id = in_id
    end
    
    # drop get prefix?
    def get_id()
      @id
    end
    
    def get_files()
      @files
    end
    # Initialize hash at startup
    # Possible? Or problem with self object?
  end
  
  class Repos
    def initialize()
      # Create manifest
      # It's a list of snapshots in chronological order
      @manifest = {"default" => []}
      @curr_branch = "default"
      # what to do about branch IDs?
      # Read in project path and make manifest file?
      # Create current
    end
    
    def manifest()
      @manifest
    end
    
    def make_snapshot(file_array)
      # Return hash ID of snapshot
      new_snap = Snapshot.new(file_array)
      # Set ID, consider breaking up that line
      new_snap.set_id(Digest::SHA256.hexdigest(Marshal.dump(new_snap)))
      @manifest[@curr_branch].push(new_snap)
      # Update manifest file?
      return new_snap.get_id()
    end
    
    def get_snapshot(target_id)
      # Return snapshot (or just contents) given id
      # Find snapshot
      found_index = @manifest[@curr_branch].index{ |x| x.get_id() == target_id }
      # Handle not found case
      # Return it
      if(found_index)
        return @manifest[@curr_branch][found_index]
      else
        return found_index
      end
      #return ret_snap
    end
    
    # Not sure how I'm gonna do this one
    def restore_snapshot(target_id)
      # Return comm object with status
      # Need a way to change files in workspace
      return 1
    end
    
    #def history(branch_name)
    def history()
      # Return array of snapshot IDs
      names_list = []
      @manifest[@curr_branch].each {|x| names_list.push(x.get_id())}
      return names_list
    end
    
    def delete_snapshot(target_id)
      # Return comm object with status
      # Find snapshot, delete from manifest/memory
      @manifest[@curr_branch].delete_if { |x| x.get_id() == target_id }
      # catch error
      # update manifest file?
    end
    
    # Finds the files in snap1 that aren't in snap2, change this?
    # Consider using diffy?
    def diff_snapshots(id1, id2)
      # Return list of filenames and versions
      diff_files = []
      # Put in error catching
      files1 = get_snapshot(id1).get_files()
      files2 = get_snapshot(id2).get_files()
      # Find snapshot1 and snapshot2
      files1.each do |x|
        if(!files2.include?(x))
          diff_files.push(x)
        end
      end
      return diff_files
      # Use revlog diff on each set of files? Look at Diffy
    end
    
    def make_branch(branch_name)
      # Return hash ID of new branch
      # Not sure where to store branches
      # What goes in to the hash?
      @manifest[branch_name] = @manifest[@curr_branch]
      @curr_branch = branch_name
      return 1
    end
    
    def delete_branch(branch_name)
      # Exit status code
      @manifest.delete("branch_name")
    end
    
    def clear()
      # Just a placeholder for now
    end
    
  end
end


