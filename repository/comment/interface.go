package comment

import (
	"eventapp/entities/graph/model"
)

type Comment interface {
	Get(eventId int) ([]model.CommentResponse, error)
	Create(model.Comment) (model.Comment, error)
}
