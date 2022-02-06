package graph

//go:generate go run github.com/99designs/gqlgen generate
// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

import (
	_authRepo "eventapp/repository/auth"
	_eventRepo "eventapp/repository/event"
	_participationRepo "eventapp/repository/participation"
	_userRepo "eventapp/repository/user"
)

type Resolver struct {
	userRepo          _userRepo.User
	authRepo          _authRepo.Auth
	eventRepo         _eventRepo.Event
	participationRepo _participationRepo.Participation
}

func NewResolver(ar _authRepo.Auth, ur _userRepo.User, er _eventRepo.Event, pr _participationRepo.Participation) *Resolver {
	return &Resolver{
		userRepo:          ur,
		authRepo:          ar,
		eventRepo:         er,
		participationRepo: pr,
	}
}
