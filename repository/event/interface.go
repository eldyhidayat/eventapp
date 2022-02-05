package event

import (
	"eventapp/entities/graph/model"
)

type Event interface {
	Get(userid *int, categoryid *int, keyword *string, offset *int, limit *int) ([]model.Event, error)
	GetbyId(id int) (model.Event, error)
	Create(model.Event) (model.Event, error)
	Update(id int, user model.Event) (model.Event, error)
	Delete(id int) error
}
