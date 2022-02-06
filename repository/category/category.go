package category

import (
	"database/sql"
	"eventapp/entities/graph/model"
	"log"
)

type CategoryRepository struct {
	db *sql.DB
}

func New(db *sql.DB) *CategoryRepository {
	return &CategoryRepository{db: db}
}

func (r *CategoryRepository) Get() ([]model.Categories, error) {

	stmt, err := r.db.Prepare("select id, category from categories")
	if err != nil {
		log.Fatal(err)
	}

	var categories []model.Categories

	result, err := stmt.Query()
	if err != nil {
		return categories, err
	}

	defer result.Close()

	for result.Next() {
		var category model.Categories
		err := result.Scan(&category.ID, &category.Category)
		if err != nil {
			log.Fatal("error di scan get category")
		}
		categories = append(categories, category)
	}
	return categories, nil

}
