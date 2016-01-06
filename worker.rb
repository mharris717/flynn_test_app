require 'mharris_ext'

loop do
  File.append "worker.log","#{Time.now}\n"
  sleep 5
end