package graph

//go:generate go run github.com/99designs/gqlgen generate
// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

import (
	_authRepo "eventapp/repository/auth"
	_categoryRepo "eventapp/repository/category"
	_commentRepo "eventapp/repository/comment"
	_eventRepo "eventapp/repository/event"
	_participationRepo "eventapp/repository/participation"
	_userRepo "eventapp/repository/user"
)

type Resolver struct {
	userRepo          _userRepo.User
	authRepo          _authRepo.Auth
	eventRepo         _eventRepo.Event
	participationRepo _participationRepo.Participation
	commentRepo       _commentRepo.Comment
	categoryRepo      _categoryRepo.Category
}

func NewResolver(ar _authRepo.Auth,
	ur _userRepo.User,
	er _eventRepo.Event,
	pr _participationRepo.Participation,
	cr _commentRepo.Comment,
	ctr _categoryRepo.Category) *Resolver {
	return &Resolver{
		userRepo:          ur,
		authRepo:          ar,
		eventRepo:         er,
		participationRepo: pr,
		commentRepo:       cr,
		categoryRepo:      ctr,
	}
}
