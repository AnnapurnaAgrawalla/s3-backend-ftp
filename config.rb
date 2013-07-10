require './ftpdriver'

#missing = %w[ACCESS_KEY_ID SECRET_ACCESS_KEY BUCKET].reject { |name| ENV[name] }
#raise "missing env variables: #{missing}" unless missing.empty?


driver FTPDriver
port 9091
#port ENV['PORT']
#driver_args 1, 2
#user      "ftp"
#group     "ftp"
daemonise false
name      "ftp"
pid_file  "/var/run/ftp.pid"
