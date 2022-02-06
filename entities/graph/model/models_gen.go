// Code generated by github.com/99designs/gqlgen, DO NOT EDIT.

package model

type Categories struct {
	ID       int    `json:"id"`
	Category string `json:"category"`
}

type Comment struct {
	ID      int    `json:"id"`
	UserID  int    `json:"userId"`
	EventID int    `json:"eventId"`
	Comment string `json:"comment"`
}

type Event struct {
	ID           int    `json:"id"`
	Name         string `json:"name"`
	UserID       int    `json:"userId"`
	UserName     string `json:"userName"`
	Promotor     string `json:"promotor"`
	CategoryID   int    `json:"categoryId"`
	CategoryName string `json:"categoryName"`
	Datetime     string `json:"datetime"`
	Location     string `json:"location"`
	Description  string `json:"description"`
	Photo        string `json:"photo"`
}

type LoginResponse struct {
	Message string `json:"message"`
	Name    string `json:"name"`
	Email   string `json:"email"`
	Token   string `json:"token"`
}

type Message struct {
	Message string `json:"message"`
}

type NewEvent struct {
	Name        string `json:"name"`
	UserID      *int   `json:"userId"`
	Promotor    string `json:"promotor"`
	CategoryID  int    `json:"categoryId"`
	Datetime    string `json:"datetime"`
	Location    string `json:"location"`
	Description string `json:"description"`
	Photo       string `json:"photo"`
}

type NewUser struct {
	Name        string  `json:"name"`
	Email       string  `json:"email"`
	Password    string  `json:"password"`
	PhoneNumber *string `json:"phoneNumber"`
	Avatar      *string `json:"avatar"`
}

type Participation struct {
	ID      int `json:"id"`
	UserID  int `json:"userId"`
	EventID int `json:"eventId"`
}

type UpdateEvent struct {
	Name        string `json:"name"`
	Promotor    string `json:"promotor"`
	CategoryID  int    `json:"categoryId"`
	Datetime    string `json:"datetime"`
	Location    string `json:"location"`
	Description string `json:"description"`
	Photo       string `json:"photo"`
}

type UpdateUser struct {
	Name        *string `json:"name"`
	Email       *string `json:"email"`
	Password    *string `json:"password"`
	PhoneNumber *string `json:"phoneNumber"`
	Avatar      *string `json:"avatar"`
}

type User struct {
	ID          *int    `json:"id"`
	Name        string  `json:"name"`
	Email       string  `json:"email"`
	Password    string  `json:"password"`
	PhoneNumber *string `json:"phoneNumber"`
	Avatar      *string `json:"avatar"`
}
