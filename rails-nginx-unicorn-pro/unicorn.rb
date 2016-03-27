app_dir = "/app"
 
working_directory app_dir
 
pid "#{app_dir}/tmp/unicorn.pid"
 
worker_processes 1
listen "/tmp/unicorn.sock", :backlog => 64
timeout 30
