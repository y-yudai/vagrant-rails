REROAD_PROFILE = ". ~/.profile"
execute "ubuntu update" do
  command "apt-get -y update"
end
package 'build-essential'
package 'libssl-dev'
package 'libreadline-dev'
package 'git'
# package 'nginx'
# package 'libsqlite3-dev'
execute "rbenv install" do
  not_if "ls ~/.rbenv"
  command "git clone https://github.com/sstephenson/rbenv.git ~/.rbenv && git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"
end

execute "update .profile for rbenv" do
  not_if %(#{REROAD_PROFILE} && rbenv --help)
  command %(echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile && echo 'eval "$(rbenv init -)"' >> ~/.profile)
end

execute "install ruby" do
  command "#{REROAD_PROFILE} && rbenv install -s 2.4.2"
end

execute "apply rbenv specific version" do
  command "#{REROAD_PROFILE} && rbenv global 2.3.1"
end

execute "install bundler" do
  command "#{REROAD_PROFILE} && rbenv exec gem install bundler"
end

execute "install rails" do
  command "#{REROAD_PROFILE} && rbenv exec gem install rails"
end