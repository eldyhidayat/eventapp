package event

import (
	"database/sql"
	"eventapp/entities/graph/model"
	"fmt"
	"log"
)

type EventRepository struct {
	db *sql.DB
}

func New(db *sql.DB) *EventRepository {
	return &EventRepository{db: db}
}

func (r *EventRepository) Get() ([]model.Event, error) {

	stmt, err := r.db.Prepare("select id, name, userid, promotor, category, date, location, description, photo from events where deleted_at is null ")
	if err != nil {
		log.Fatal(err)
	}

	var events []model.Event

	result, err := stmt.Query()
	if err != nil {
		return events, err
	}

	defer result.Close()

	for result.Next() {
		var event model.Event
		err := result.Scan(&event.ID, &event.Name, &event.UserID, &event.Promotor, &event.Category, &event.Datetime, &event.Location, &event.Description, &event.Photo)
		if err != nil {
			log.Fatal("error di scan getUser")
		}
		events = append(events, event)
	}
	return events, nil

}

func (r *EventRepository) GetbyId(id int) (model.Event, error) {
	var event model.Event
	stmt, err := r.db.Prepare("select id, name, userid, promotor, category, date, location, description, photo from events where id = ? deleted_at is null ")
	if err != nil {
		//log.Fatal(err)
		return event, fmt.Errorf("gagal prepare db")
	}

	result, err := stmt.Query(id)
	if err != nil {
		return event, fmt.Errorf("gagal query event")
	}

	defer result.Close()

	for result.Next() {
		err := result.Scan(&event.ID, &event.Name, &event.UserID, &event.Promotor, &event.Category, &event.Datetime, &event.Location, &event.Description, &event.Photo)
		if err != nil {
			return event, err
		}
		return event, nil
	}

	return event, fmt.Errorf("event not found")
}

func (r *EventRepository) Create(event model.Event) (model.Event, error) {
	stmt, err := r.db.Prepare("INSERT INTO events(name, userid, promotor, category, date, location, description, photo) VALUES(?,?,?,?,?,?,?,?)")
	if err != nil {
		log.Fatal(err)
	}

	result, err := stmt.Exec(event.Name, event.UserID, event.Promotor, event.Category, event.Datetime, event.Location, event.Description, event.Photo)
	if err != nil {
		return event, fmt.Errorf("gagal exec")
	}

	notAffected, _ := result.RowsAffected()
	if notAffected == 0 {
		return event, fmt.Errorf("event not created")
	}

	return event, nil
}

func (r *EventRepository) Update(id int, event model.Event) (model.Event, error) {
	stmt, err := r.db.Prepare("UPDATE events SET name= ?, promotor= ?, category= ?, date= ?, location= ?, description= ?, photo= ? WHERE id = ?")
	if err != nil {
		// log.Fatal(err)
		return event, fmt.Errorf("gagal prepare update")
	}

	result, error := stmt.Exec(event.Name, event.Promotor, event.Category, event.Datetime, event.Location, event.Description, event.Photo, id)
	if error != nil {
		return event, fmt.Errorf("gagal exec update")
	}

	notAffected, _ := result.RowsAffected()
	if notAffected == 0 {
		return event, fmt.Errorf("row not affected")
	}

	return event, nil
}

func (r *EventRepository) Delete(id int) error {
	stmt, err := r.db.Prepare("UPDATE events SET deleted_at = current_timestamp where id = ?")
	if err != nil {
		log.Fatal(err)
	}

	result, err := stmt.Exec(id)
	if err != nil {
		return err
	}

	notAffected, _ := result.RowsAffected()
	if notAffected == 0 {
		return fmt.Errorf("event not found")
	}

	return nil
}
