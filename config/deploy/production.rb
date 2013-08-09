
# My local dev server
server "tl.bergensquash.no", :web, :app

set :branch,        "master"
set :user,          "mcraft"
set :group,         "mcraft"

set :deploy_to,  "/opt/#{application}"