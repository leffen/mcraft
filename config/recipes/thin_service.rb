# -*- coding: utf-8 -*-
# installs nessesary files for running thin on Ubuntu 12.04 (++)

set_default(:thin_user) { user }
set_default(:thin_config) { "#{shared_path}/config/thin.yml" }
set_default(:thin_log) { "#{shared_path}/log/thin.log" }

namespace :thin do
  desc "Setup app configuration with thin as web server"
  task :setup, roles: :web do
    unless remote_file_exists?("/etc/init.d/thin_#{application}")
      template "thin_service.sh", "/tmp/thin_service.sh"
      run "chmod +x /tmp/thin_service.sh"
      run "#{sudo} cp /tmp/thin_service.sh /etc/init.d/thin_#{application}"
      run "#{sudo} update-rc.d -f thin_#{application} defaults;"
    end
  end

#  after "deploy:finalize_update", "thin:setup"

end
