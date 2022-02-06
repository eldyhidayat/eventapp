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
		CategoryID:  input.CategoryID,
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
		CategoryID:  res.CategoryID,
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
		fmt.Println("1", dataLogin)
		return nil, errors.New("unauthorized")
	} else {
		convData = ctx.Value("EchoContextKey").(*middlewares.User)
		fmt.Println("id user", convData.Id)
	}
	userid, err := r.eventRepo.GetbyId(id)
	fmt.Println("userid", userid)
	if userid.UserID != convData.Id {
		fmt.Println("2", userid.UserID)
		return nil, errors.New("unauthorized")
	}
	event, err := r.eventRepo.GetbyId(id)
	if err != nil {
		return nil, errors.New("not found")
	}
	event.Name = set.Name
	event.Promotor = set.Promotor
	event.CategoryID = set.CategoryID
	event.Datetime = set.Datetime
	event.Location = set.Location
	event.Description = set.Description
	event.Photo = set.Photo

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
		CategoryID:  res.CategoryID,
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
	var convData *middlewares.User
	if dataLogin == nil {
		return nil, errors.New("unauthorized")
	} else {
		convData = ctx.Value("EchoContextKey").(*middlewares.User)
		fmt.Println("id user", convData.Id)
	}
	userid, err := r.eventRepo.GetbyId(id)
	if err != nil {
		return nil, errors.New("failed get event by id")
	}
	if userid.UserID != convData.Id {
		return nil, errors.New("unauthorized")
	}

	errr := r.eventRepo.Delete(id)
	if errr != nil {
		return nil, errors.New("failed Delete Event")
	}
	responseMessage := model.Message{
		Message: "Success Delete Event",
	}
	return &responseMessage, nil
}

func (r *mutationResolver) JoinEvent(ctx context.Context, eventid int) (*model.Participation, error) {
	dataLogin := ctx.Value("EchoContextKey") // auth jwt
	var convData *middlewares.User
	if dataLogin == nil {
		return nil, errors.New("unauthorized")
	} else {
		convData = ctx.Value("EchoContextKey").(*middlewares.User)
		fmt.Println("id user", convData.Id)
	}
	userId := convData.Id
	participationData := model.Participation{
		UserID:  userId,
		EventID: eventid,
	}
	res, err := r.participationRepo.Create(participationData)
	if err != nil {
		return nil, errors.New("failed Create Event")
	}
	responseMessage := model.Participation{
		ID:      res.ID,
		UserID:  res.UserID,
		EventID: res.EventID,
	}
	return &responseMessage, nil
}

func (r *mutationResolver) CreateComment(ctx context.Context, eventid int, comment string) (*model.Comment, error) {
	dataLogin := ctx.Value("EchoContextKey") // auth jwt
	var convData *middlewares.User
	if dataLogin == nil {
		return nil, errors.New("unauthorized")
	} else {
		convData = ctx.Value("EchoContextKey").(*middlewares.User)
		fmt.Println("id user", convData.Id)
	}
	userId := convData.Id
	commentData := model.Comment{
		UserID:  userId,
		EventID: eventid,
		Comment: comment,
	}
	res, err := r.commentRepo.Create(commentData)
	if err != nil {
		return nil, errors.New("failed Create Comment")
	}
	responseMessage := model.Comment{
		ID:      res.ID,
		UserID:  res.UserID,
		EventID: res.EventID,
		Comment: res.Comment,
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

func (r *queryResolver) Events(ctx context.Context, userid *int, categoryid *int, keyword *string, offset *int, limit *int) ([]*model.Event, error) {
	//panic(fmt.Errorf("not implemented"))
	responseData, err := r.eventRepo.Get(userid, categoryid, keyword, offset, limit)

	if err != nil {
		return nil, errors.New("user not found")
	}

	eventResponseData := []*model.Event{}

	for _, event := range responseData {
		//convertID := int(*event.ID)
		eventResponseData = append(eventResponseData, &model.Event{ID: event.ID, Name: event.Name, UserID: event.UserID, UserName: event.UserName, Promotor: event.Promotor, CategoryID: event.CategoryID, CategoryName: event.CategoryName, Datetime: event.Datetime, Location: event.Location, Description: event.Description, Photo: event.Photo})
	}

	return eventResponseData, nil
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
	responseEventData.UserName = responseData.UserName
	responseEventData.Promotor = responseData.Promotor
	responseEventData.CategoryName = responseData.CategoryName
	responseEventData.Datetime = responseData.Datetime
	responseEventData.Location = responseData.Location
	responseEventData.Description = responseData.Description
	responseEventData.Photo = responseData.Photo
	return &responseEventData, nil
}

func (r *queryResolver) Participants(ctx context.Context, eventid int) ([]*model.User, error) {
	responseData, err := r.participationRepo.Get(eventid)

	if err != nil {
		return nil, errors.New("participants not found")
	}

	userResponseData := []*model.User{}

	for _, user := range responseData {
		convertID := int(*user.ID)
		userResponseData = append(userResponseData, &model.User{ID: &convertID, Name: user.Name, Email: user.Email, Password: user.Password, PhoneNumber: user.PhoneNumber, Avatar: user.Avatar})
	}

	return userResponseData, nil
}

func (r *queryResolver) ReadComment(ctx context.Context, eventid int) ([]*model.Comment, error) {
	responseData, err := r.commentRepo.Get(eventid)

	if err != nil {
		return nil, errors.New("comments not found")
	}

	commentResponseData := []*model.Comment{}

	for _, comment := range responseData {
		commentResponseData = append(commentResponseData, &model.Comment{ID: comment.ID, UserID: comment.UserID, EventID: comment.EventID, Comment: comment.Comment})
	}

	return commentResponseData, nil
}

func (r *queryResolver) Categories(ctx context.Context) ([]*model.Categories, error) {
	responseData, err := r.categoryRepo.Get()

	if err != nil {
		return nil, errors.New("comments not found")
	}

	categoriesResponseData := []*model.Categories{}

	for _, category := range responseData {
		categoriesResponseData = append(categoriesResponseData, &model.Categories{ID: category.ID, Category: category.Category})
	}

	return categoriesResponseData, nil
}

// Mutation returns generated.MutationResolver implementation.
func (r *Resolver) Mutation() generated.MutationResolver { return &mutationResolver{r} }

// Query returns generated.QueryResolver implementation.
func (r *Resolver) Query() generated.QueryResolver { return &queryResolver{r} }

type mutationResolver struct{ *Resolver }
type queryResolver struct{ *Resolver }
