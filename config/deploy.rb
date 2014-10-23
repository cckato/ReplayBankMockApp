# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'ReplayBankMockApp'
set :repo_url, 'git@github.com:naname137/ReplayBankMockApp.git'
set :p_dir, 'rails_projects'

task :deploy_to_aws do
  release_path = File.join(fetch(:p_dir), fetch(:application))
  on roles(:app) do
    unless test "[ -d #{fetch :p_dir} ]"
      execute "mkdir #{fetch :p_dir};"
    end

    if test "[ -d #{release_path} ]"
      execute "cd #{release_path}; git pull"
      running_pid = capture("ps -ef | grep 'usr/bin/ruby2.0 bin/rails s' | head -n 1 | awk '{print $2}'")
      pid_info = capture("ps -ef | grep 'usr/bin/ruby2.0 bin/rails s' | head -n 1 | awk '{print $8}'")
      unless pid_info.include?('grep') || pid_info.include?('bash')
        execute "kill #{running_pid}"
      end
    else
      execute "cd #{fetch :p_dir}; git clone #{fetch :repo_url} ./#{fetch :application}"
    end

    execute "cd #{release_path}; ~/bin/bundle"
    execute "cd #{release_path}; ~/bin/spring stop"
    execute "cd #{release_path}; ~/bin/rake db:migrate"
    execute "cd #{release_path}; ~/bin/rake assets:precompile"
    execute "cd #{release_path}; ~/bin/rails s"
  end
end

