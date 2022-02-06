package participation

import (
	"database/sql"
	"eventapp/entities/graph/model"
	"fmt"
	"log"
)

type ParticipationRepository struct {
	db *sql.DB
}

func New(db *sql.DB) *ParticipationRepository {
	return &ParticipationRepository{db: db}
}

func (r *ParticipationRepository) Get(eventId int) ([]model.User, error) {
	stmt, err := r.db.Prepare(`select u.id, u.name, u.email, u.phone, u.avatar from users u 
	where u.deleted_at is null and u.id in (select p.userid from participants p where p.eventid =?)`)
	if err != nil {
		log.Fatal(err)
	}

	var participants []model.User

	result, err := stmt.Query(eventId)
	if err != nil {
		return participants, err
	}

	defer result.Close()

	for result.Next() {
		var participant model.User
		err := result.Scan(&participant.ID, &participant.Name, &participant.Email, &participant.PhoneNumber, &participant.Avatar)
		if err != nil {
			log.Fatal("error di scan get participants")
		}
		participants = append(participants, participant)
	}
	return participants, nil
}

func (r *ParticipationRepository) Create(participation model.Participation) (model.Participation, error) {
	stmt, err := r.db.Prepare("INSERT INTO participants(eventid, userid) VALUES(?,?)")
	if err != nil {
		log.Fatal(err)
	}

	result, err := stmt.Exec(participation.EventID, participation.UserID)
	if err != nil {
		return participation, fmt.Errorf("gagal exec")
	}

	notAffected, _ := result.RowsAffected()
	if notAffected == 0 {
		return participation, fmt.Errorf("user not created")
	}

	return participation, nil
}
