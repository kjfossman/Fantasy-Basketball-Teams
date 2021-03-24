require "./config/environment"

use Rack::MethodOverride

use UsersController
use SessionsController
use UserTeamsController
use PlayersController
run ApplicationController