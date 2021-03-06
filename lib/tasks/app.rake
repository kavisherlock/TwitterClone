namespace :app do
  desc 'Rebuild the database. Useful when checking out to a new branch.'
  task :reset do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end

  desc 'Starts the application server and binds to ip 0.0.0.0'
  task :serve do
    if Rails.env.development?
      exec('rails s -b 0.0.0.0 -p 4000')
    end
  end
end