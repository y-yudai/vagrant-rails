REROAD_PROFILE = ". ~/.profile"

package 'nodejs'
package 'npm'

execute "install yarn" do
  command "#{REROAD_PROFILE} && sudo npm install --global yarn"
end
