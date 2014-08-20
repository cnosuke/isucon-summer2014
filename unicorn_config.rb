worker_processes 20
preload_app true

log = './log/unicorn.log'

pid './tmp/unicorn.pid'
stderr_path log
stdout_path log

after_fork do |server, worker|
  # GCは止めてはいけません！！！
  # GC.disable
end
