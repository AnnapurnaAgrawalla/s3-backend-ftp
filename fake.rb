require 'socket'
require 'stringio'
require 'tempfile'
require 'eventmachine'
require 'em/protocols/line_protocol'
require 'aws/s3'
require "rexml/document"
include REXML
AWS::S3
class FakeFTPDriver

  attr_accessor :username, :password
  $key = 'AKIAJFPIHK4NAK4WUM5A'                                #This is access_key_id
  $skey = 'ra+rjapL9hdTIsVLK0VUCRuaxkuTeXlkcTj7bmgB'           #This is secret_access_key
  $bkt = 'em-ftpd-trial/annapurna'                          #This is bucket name

  FILE_ONE = "file does not exist"
  FILE_TWO = "This is the file number two.\n\n2009-03-21"
  
  
#user authentication code
  def authenticate(user, pass, &block)
    userArray = []
   
	userArray = FakeFTPDriver.find                           #calling to find function 
    userArray.each do |p|
        if user == p.username && pass == p.password          #to checking correct username & password
	    yield true
		return
	  end
	end  
    yield false	
  end
  
  def self.find
     userArray = []
	 if file_usable?                                     #here calling to file usable? function
		  file = File.new('users.txt','r')                  #open users file for checking username and password
		 file.each_line do |line|
		    userArray << FakeFTPDriver.new.import_line(line.chomp)      #here taking each line from file
		 end
		file.close
	else
	   puts "file doesnot exists"
	end   
	return userArray
  end	
  
  def import_line(line)
	 line_array = line.split("\t")                       #here to split line data by tab
	 @username, @password = line_array                   #here giving data into username & password variable
	 return self
 end
 
 def self.file_usable?
	 return false unless File.exists?("users.txt")           #this function used to check file is exist or not?
	 return true
 end

#upload file code
  def put_file(path, data, &block)                                    #this is put file for upload file you can use at a time put file or put stream file
  	 
    AWS::S3::Base.establish_connection!(:access_key_id => $key, :secret_access_key => $skey)     #here propery connection done
    AWS::S3::S3Object.store(path, open(data), $bkt)
    yield File.size(data)                                                                         #here return size of file in bytes
  end
 
  #upload streaming file code
  #def put_file_streamed(path, data, &block)                   #this method is used for upload data by streaming
       
   #  AWS::S3::Base.establish_connection!(:access_key_id => $key, :secret_access_key => $skey)	    #here propery connection done  
    # data.on_stream { |chunk|
     #AWS::S3::S3Object.store(path, chunk, $bkt)
     #}
    #yield '#{$bkt}#{path}'.size                                        #here return size of file in bytes
 #end
 
 #delete file code
  def delete_file(path, &block)
  	AWS::S3::Base.establish_connection!(:access_key_id => $key, :secret_access_key => $skey)             #here propery connection done  
  	AWS::S3::S3Object.delete path, $bkt                                                             #here file gets deleted
    yield true
  end

  private

  def dir_item(name)
    EM::FTPD::DirectoryItem.new(:name => name, :directory => true, :size => 0)
  end

  def file_item(name, bytes)
    EM::FTPD::DirectoryItem.new(:name => name, :directory => false, :size => bytes)
  end

end
