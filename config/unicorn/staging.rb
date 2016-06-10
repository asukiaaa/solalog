worker_processes 2
app_directory = "/var/www/staging/solalog"
working_directory "#{app_directory}/current"

stderr_path "#{app_directory}/shared/tmp/pids/unicorn.log"
stdout_path "#{app_directory}/shared/tmp/pids/unicorn.log"

pid "#{app_directory}/shared/tmp/pids/unicorn.pid"
listen "#{app_directory}/shared/tmp/pids/unicorn.sock"

timeout 30

preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
