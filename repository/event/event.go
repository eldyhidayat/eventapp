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

func (r *EventRepository) Get(categoryid *int, keyword *string, limit *int, page *int) ([]model.Event, error) {
	var err error
	var result *sql.Rows
	if keyword != nil {
		result, err = r.db.Query(
			`select e.id, e.name, u.name, e.promotor, c.category, e.date, e.location, e.description, e.photo from events e 
join users u on e.userid = u.id	
join categories c on e.categoryid = c.id
where upper(e.name) like %?% and e.deleted_at is null limit ? offset ?`, keyword, limit, (*page-1)*(*limit))
	} else if categoryid != nil {
		result, err = r.db.Query(
			`select e.id, e.name, u.name, e.promotor, c.category, e.date, e.location, e.description, e.photo from events e 
join users u on e.userid = u.id	
join categories c on e.categoryid = c.id
where e.categoryid = ? and e.deleted_at is null  limit ? offset ?`, categoryid, limit, (*page-1)*(*limit))
	} else {
		result, err = r.db.Query(
			`select e.id, e.name, u.name, e.promotor, c.category, e.date, e.location, e.description, e.photo from events e 
join users u on e.userid = u.id	
join categories c on e.categoryid = c.id
where e.deleted_at is null  limit ? offset ?`, limit, (*page-1)*(*limit))
	}
	if err != nil {
		fmt.Println("Get 1", err)
		return nil, err
	}
	var events []model.Event
	for result.Next() {
		var event model.Event
		err := result.Scan(&event.ID, &event.Name, &event.UserName, &event.Promotor, &event.CategoryName, &event.Datetime, &event.Location, &event.Description, &event.Photo)
		if err != nil {
			log.Fatal("error di scan getEvent")
		}
		events = append(events, event)
	}
	return events, nil
}

func (r *EventRepository) GetbyId(id int) (model.Event, error) {
	var event model.Event
	stmt, err := r.db.Prepare(`select e.id, e.name, u.id, u.name, e.promotor, c.id, c.category, e.date, e.location, e.description, e.photo from events e 
join users u on e.userid = u.id	
join categories c on e.categoryid = c.id
where e.id = ? and e.deleted_at is null`)
	if err != nil {
		//log.Fatal(err)
		fmt.Println("3", err)
		return event, fmt.Errorf("gagal prepare db")
	}

	result, err := stmt.Query(id)
	if err != nil {
		fmt.Println("1", err)
		return event, fmt.Errorf("gagal query event")
	}

	defer result.Close()

	for result.Next() {
		err := result.Scan(&event.ID, &event.Name, &event.UserID, &event.UserName, &event.Promotor, &event.CategoryID, &event.CategoryName, &event.Datetime, &event.Location, &event.Description, &event.Photo)
		if err != nil {
			fmt.Println("2", err)
			return event, err
		}
		fmt.Println(event.UserName)
		return event, nil
	}

	return event, fmt.Errorf("event not found")
}

func (r *EventRepository) Create(event model.Event) (model.Event, error) {
	stmt, err := r.db.Prepare("INSERT INTO events(name, userid, promotor, categoryid, date, location, description, photo) VALUES(?,?,?,?,?,?,?,?)")
	if err != nil {
		log.Fatal(err)
	}

	result, err := stmt.Exec(event.Name, event.UserID, event.Promotor, event.CategoryID, event.Datetime, event.Location, event.Description, event.Photo)
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
	stmt, err := r.db.Prepare("UPDATE events SET name= ?, promotor= ?, categoryid= ?, date= ?, location= ?, description= ?, photo= ? WHERE id = ?")
	if err != nil {
		fmt.Println("1", err)
		// log.Fatal(err)
		return event, fmt.Errorf("gagal prepare update")
	}

	result, error := stmt.Exec(event.Name, event.Promotor, event.CategoryID, event.Datetime, event.Location, event.Description, event.Photo, id)
	if error != nil {
		fmt.Println("2", error)
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
