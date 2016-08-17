namespace :no_seed do
  desc "Reset the database but it doesn't run the seed."
  task reset: ['db:drop', 'db:create', 'db:migrate']
end
