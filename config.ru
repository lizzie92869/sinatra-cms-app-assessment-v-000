require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use MaleAvatarsController
use FemaleAvatarsController
use UsersController
run ApplicationController