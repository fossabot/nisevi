# frozen_string_literal: true

bind "tcp://#{ENV['LISTEN_ON'] || '0.0.0.0:8000'}"

workers Integer(ENV['WEB_CONCURRENCY'] || 2)

min_threads = Integer(ENV['MIN_THREADS'] || 1)
max_threads = Integer(ENV['MAX_THREADS'] || 5)
threads min_threads, max_threads

worker_timeout 30

preload_app!

restart_command 'bin/puma'

on_worker_boot do
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end
