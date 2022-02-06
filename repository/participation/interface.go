package participation

import (
	"eventapp/entities/graph/model"
)

type Participation interface {
	Get(eventId int) ([]model.User, error)
	Create(model.Participation) (model.Participation, error)
}
