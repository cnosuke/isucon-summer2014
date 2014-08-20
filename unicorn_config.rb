worker_processes 20
preload_app true

after_fork do |server, worker|
  GC.disable
end
