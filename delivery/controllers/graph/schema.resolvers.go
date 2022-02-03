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

	"golang.org/x/crypto/bcrypt"
)

func (r *mutationResolver) CreateUser(ctx context.Context, input model.NewUser) (*model.User, error) {
	// passwordHash, _ := bcrypt.GenerateFromPassword([]byte(input.Password), bcrypt.MinCost)
	hashedPassword, errEncrypt := bcrypt.GenerateFromPassword([]byte(input.Password), bcrypt.DefaultCost)
	if errEncrypt != nil {
		return nil, errors.New("failed encrypt password")
	}
	userData := model.User{
		Name:     input.Name,
		Password: string(hashedPassword),
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
		Name:        res.Name,
		Email:       res.Email,
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
	// user.Name = *set.Name //-----invalid memory address
	// user.Email = *set.Email
	// passwordHash, _ := bcrypt.GenerateFromPassword([]byte(*set.Password), bcrypt.MinCost)
	// user.Password = string(passwordHash)
	// user.Password = *set.Password

	if set.Name != nil {
		user.Name = *set.Name
	}

	if set.Email != nil {
		user.Email = *set.Email
	}

	if set.Password != nil {
		hashedPassword, errEncrypt := bcrypt.GenerateFromPassword([]byte(*set.Password), bcrypt.DefaultCost)
		if errEncrypt != nil {
			return nil, errors.New("failed encrypt password")
		}
		user.Password = string(hashedPassword)
	}
	if set.PhoneNumber != nil {
		user.PhoneNumber = set.PhoneNumber
	}
	if set.Avatar != nil {
		user.Avatar = set.Avatar
	}
	res, errr := r.userRepo.Update(id, user)
	if errr != nil {
		fmt.Println("err update", errr)
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
		Message: "Succes Delete User",
	}
	return &responseMessage, nil
}

func (r *mutationResolver) CreateEvent(ctx context.Context, input model.NewEvent) (*model.Event, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *mutationResolver) UpdateEvent(ctx context.Context, id int, set model.UpdateEvent) (*model.Event, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *mutationResolver) DeleteEvent(ctx context.Context, id int) (*model.Message, error) {
	panic(fmt.Errorf("not implemented"))
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
	panic(fmt.Errorf("not implemented"))
}

// Mutation returns generated.MutationResolver implementation.
func (r *Resolver) Mutation() generated.MutationResolver { return &mutationResolver{r} }

// Query returns generated.QueryResolver implementation.
func (r *Resolver) Query() generated.QueryResolver { return &queryResolver{r} }

type mutationResolver struct{ *Resolver }
type queryResolver struct{ *Resolver }
