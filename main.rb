require 'sinatra'
require 'mharris_ext'

get "/" do
  res = {}
  res[:time] = Time.now

  n = params[:n]
  res[:param] = n if n.present?

  file = "worker.log"
  if FileTest.exist?(file)
    line = File.read(file).split("\n").last
    res[:worker] = line if line.present?
  end

  str = []
  res.each do |k,v|
    str << "#{k}: #{v}"
  end
  str.join("<br>")
end