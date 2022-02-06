package comment

import (
	"eventapp/entities/graph/model"
)

type Comment interface {
	Get(eventId int) ([]model.Comment, error)
	Create(model.Comment) (model.Comment, error)
}
