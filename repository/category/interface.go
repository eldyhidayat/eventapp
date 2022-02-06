package category

import (
	"eventapp/entities/graph/model"
)

type Category interface {
	Get() ([]model.Categories, error)
}
