namespace :db do
  desc "Refresh the database (drop-create-migrate)."
  task refresh: ['db:drop', 'db:create', 'db:migrate']

  desc "Reload the database (drop-create-migrate-seed)."
  task reload: ['db:refresh', 'db:seed']
end
