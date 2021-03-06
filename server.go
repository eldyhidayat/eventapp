package main

import (
	_config "eventapp/config"
	_graph "eventapp/delivery/controllers/graph"
	_categoryRepo "eventapp/repository/category"
	_commentRepo "eventapp/repository/comment"
	_eventRepo "eventapp/repository/event"

	_router "eventapp/delivery/routers"
	_authRepo "eventapp/repository/auth"
	_participationRepo "eventapp/repository/participation"
	_userRepo "eventapp/repository/user"
	_util "eventapp/utils"

	"fmt"

	echo "github.com/labstack/echo/v4"
	"github.com/labstack/gommon/log"
)

func main() {
	//load config if available or set to default
	config := _config.GetConfig()

	//initialize database connection based on given config
	db := _util.MysqlDriver(config)

	//initiate user model
	// authRepo := auth.New()``
	userRepo := _userRepo.New(db)
	authRepo := _authRepo.New(db)
	eventRepo := _eventRepo.New(db)
	participationRepo := _participationRepo.New(db)
	commentRepo := _commentRepo.New(db)
	categoryRepo := _categoryRepo.New(db)

	//create echo http
	e := echo.New()
	client := _graph.NewResolver(authRepo, userRepo, eventRepo, participationRepo, commentRepo, categoryRepo)
	srv := _router.NewGraphQLServer(client)
	//register API path and controller
	_router.RegisterPath(e, srv)

	// run server
	address := fmt.Sprintf(":%d", config.Port)

	if err := e.Start(address); err != nil {
		log.Info(err)
		log.Info("shutting down the server")
	}
}
