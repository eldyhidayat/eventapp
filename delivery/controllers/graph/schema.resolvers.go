package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"errors"
	"eventapp/delivery/middlewares"
	"eventapp/entities/graph/model"
	"eventapp/utils/graph/generated"
	"fmt"
)

func (r *mutationResolver) CreateUser(ctx context.Context, input model.NewUser) (*model.User, error) {
	// passwordHash, _ := bcrypt.GenerateFromPassword([]byte(input.Password), bcrypt.MinCost)
	userData := model.User{
		Name:     input.Name,
		Password: input.Password,
		// Password: string(passwordHash),
		Email:       input.Email,
		PhoneNumber: input.PhoneNumber,
		Avatar:      input.Avatar,
	}
	res, err := r.userRepo.Create(userData)
	if err != nil {
		return nil, errors.New("failed Create User")
	}
	responseMessage := model.User{
		Name:  res.Name,
		Email: res.Email,
		// Password: res.Password,
		PhoneNumber: res.PhoneNumber,
		Avatar:      res.Avatar,
	}
	return &responseMessage, nil
}

func (r *mutationResolver) UpdateUser(ctx context.Context, id int, set model.UpdateUser) (*model.User, error) {
	dataLogin := ctx.Value("EchoContextKey") // auth jwt
	var convData *middlewares.User
	if dataLogin == nil {
		return nil, errors.New("unauthorized")
	} else {
		convData = ctx.Value("EchoContextKey").(*middlewares.User)
		fmt.Println("id user", convData.Id)
	}
	if id != convData.Id {
		return nil, errors.New("unauthorized")
	}
	user, err := r.userRepo.GetbyId(id)
	if err != nil {
		return nil, errors.New("not found")
	}

	if set.Name != nil {
		user.Name = *set.Name
	}
	fmt.Println("ga masuk")

	if set.Email != nil {
		user.Email = *set.Email
	}

	if set.Password != nil {
		user.Password = *set.Password
	}
	if set.PhoneNumber != nil {
		user.PhoneNumber = set.PhoneNumber
	}
	if set.Avatar != nil {
		user.Avatar = set.Avatar
	}
	fmt.Println(user)
	res, errr := r.userRepo.Update(id, user)
	if errr != nil {
		return nil, errors.New("fail create")
	}
	responseMessage := model.User{
		ID:    res.ID,
		Name:  res.Name,
		Email: res.Email,
		// Password: res.Password,
		PhoneNumber: res.PhoneNumber,
		Avatar:      res.Avatar,
	}
	return &responseMessage, nil
}

func (r *mutationResolver) DeleteUser(ctx context.Context, id int) (*model.Message, error) {
	dataLogin := ctx.Value("EchoContextKey") // auth jwt
	if dataLogin == nil {
		return nil, errors.New("unauthorized")
	} else {
		convData := ctx.Value("EchoContextKey").(*middlewares.User)
		fmt.Println("id user", convData.Id)
	}
	if id != dataLogin.(int) {
		return nil, errors.New("unauthorized")
	}

	err := r.userRepo.Delete(id)
	if err != nil {
		return nil, errors.New("failed Delete User")
	}
	responseMessage := model.Message{
		Message: "Success Delete User",
	}
	return &responseMessage, nil
}

func (r *mutationResolver) CreateEvent(ctx context.Context, input model.NewEvent) (*model.Event, error) {
	//panic(fmt.Errorf("not implemented"))
	dataLogin := ctx.Value("EchoContextKey") // auth jwt
	if dataLogin == nil {
		return nil, errors.New("unauthorized")
	} else {
		convData := ctx.Value("EchoContextKey").(*middlewares.User)
		fmt.Println("id user", convData.Id)
	}
	convData := ctx.Value("EchoContextKey").(*middlewares.User)
	UserID := convData.Id
	eventData := model.Event{
		Name:        input.Name,
		UserID:      UserID,
		Promotor:    input.Promotor,
		Category:    input.Category,
		Datetime:    input.Datetime,
		Location:    input.Location,
		Description: input.Description,
		Photo:       input.Photo,
	}
	res, err := r.eventRepo.Create(eventData)
	if err != nil {
		return nil, errors.New("failed Create Event")
	}
	responseMessage := model.Event{
		Name:        res.Name,
		UserID:      res.UserID,
		Promotor:    res.Promotor,
		Category:    res.Category,
		Datetime:    res.Datetime,
		Location:    res.Location,
		Description: res.Description,
		Photo:       res.Photo,
	}
	return &responseMessage, nil
}

func (r *mutationResolver) UpdateEvent(ctx context.Context, id int, set model.UpdateEvent) (*model.Event, error) {
	//panic(fmt.Errorf("not implemented"))
	dataLogin := ctx.Value("EchoContextKey") // auth jwt
	var convData *middlewares.User
	if dataLogin == nil {
		return nil, errors.New("unauthorized")
	} else {
		convData = ctx.Value("EchoContextKey").(*middlewares.User)
		fmt.Println("id user", convData.Id)
	}
	userid, err := r.eventRepo.GetbyId(id)
	if userid.UserID != convData.Id {
		return nil, errors.New("unauthorized")
	}
	event, err := r.eventRepo.GetbyId(id)
	if err != nil {
		return nil, errors.New("not found")
	}

	if set.Name != nil {
		event.Name = *set.Name
	}

	if set.Promotor != nil {
		event.Promotor = *set.Promotor
	}
	if set.Category != nil {
		event.Category = *set.Category
	}
	if set.Datetime != nil {
		event.Datetime = *set.Datetime
	}
	if set.Location != nil {
		event.Location = *set.Location
	}
	if set.Description != nil {
		event.Description = *set.Description
	}
	if set.Photo != nil {
		event.Photo = *set.Photo
	}
	res, errr := r.eventRepo.Update(id, event)
	if errr != nil {
		fmt.Println(errr)
		return nil, errors.New("fail create")
	}
	responseMessage := model.Event{
		ID:          res.ID,
		Name:        res.Name,
		UserID:      res.UserID,
		Promotor:    res.Promotor,
		Category:    res.Category,
		Datetime:    res.Datetime,
		Location:    res.Location,
		Description: res.Description,
		Photo:       res.Photo,
	}
	return &responseMessage, nil
}

func (r *mutationResolver) DeleteEvent(ctx context.Context, id int) (*model.Message, error) {
	//panic(fmt.Errorf("not implemented"))
	dataLogin := ctx.Value("EchoContextKey") // auth jwt
	if dataLogin == nil {
		return nil, errors.New("unauthorized")
	} else {
		convData := ctx.Value("EchoContextKey").(*middlewares.User)
		fmt.Println("id user", convData.Id)
	}
	if id != dataLogin.(int) {
		return nil, errors.New("unauthorized")
	}

	err := r.eventRepo.Delete(id)
	if err != nil {
		return nil, errors.New("failed Delete Event")
	}
	responseMessage := model.Message{
		Message: "Success Delete Event",
	}
	return &responseMessage, nil
}

func (r *queryResolver) Users(ctx context.Context) ([]*model.User, error) {
	responseData, err := r.userRepo.Get()

	if err != nil {
		return nil, errors.New("user not found")
	}

	userResponseData := []*model.User{}

	for _, user := range responseData {
		convertID := int(*user.ID)
		userResponseData = append(userResponseData, &model.User{ID: &convertID, Name: user.Name, Email: user.Email, Password: user.Password, PhoneNumber: user.PhoneNumber, Avatar: user.Avatar})
	}

	return userResponseData, nil
}

func (r *queryResolver) UsersByID(ctx context.Context, id int) (*model.User, error) {
	responseData, err := r.userRepo.GetbyId(id)

	if err != nil {
		return nil, errors.New("not found")
	}

	responseUserData := model.User{}
	responseUserData.Email = responseData.Email
	responseUserData.ID = responseData.ID
	responseUserData.Name = responseData.Name
	responseUserData.Password = responseData.Password
	responseUserData.PhoneNumber = responseData.PhoneNumber
	responseUserData.Avatar = responseData.Avatar

	return &responseUserData, nil
}

func (r *queryResolver) AuthLogin(ctx context.Context, email string, password string) (*model.LoginResponse, error) {
	// password = hash
	user, token, err := r.authRepo.Login(email, password)
	if err != nil {
		return nil, err
	}

	response := model.LoginResponse{
		Message: "Success",
		Name:    user.Name,
		Email:   user.Email,
		Token:   token,
	}

	return &response, nil
}

func (r *queryResolver) Events(ctx context.Context) ([]*model.Event, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *queryResolver) EventsByID(ctx context.Context, id int) (*model.Event, error) {
	//panic(fmt.Errorf("not implemented"))
	responseData, err := r.eventRepo.GetbyId(id)

	if err != nil {
		return nil, errors.New("not found")
	}
	responseEventData := model.Event{}
	responseEventData.ID = responseData.ID
	responseEventData.Name = responseData.Name
	responseEventData.UserID = responseData.UserID
	responseEventData.Promotor = responseData.Promotor
	responseEventData.Category = responseData.Category
	responseEventData.Datetime = responseData.Datetime
	responseEventData.Location = responseData.Location
	responseEventData.Description = responseData.Description
	responseEventData.Photo = responseData.Photo
	return &responseEventData, nil
}

// Mutation returns generated.MutationResolver implementation.
func (r *Resolver) Mutation() generated.MutationResolver { return &mutationResolver{r} }

// Query returns generated.QueryResolver implementation.
func (r *Resolver) Query() generated.QueryResolver { return &queryResolver{r} }

type mutationResolver struct{ *Resolver }
type queryResolver struct{ *Resolver }
