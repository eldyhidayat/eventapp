package comment

import (
	"database/sql"
	"eventapp/entities/graph/model"
	"fmt"
	"log"
)

type CommentRepository struct {
	db *sql.DB
}

func New(db *sql.DB) *CommentRepository {
	return &CommentRepository{db: db}
}

func (r *CommentRepository) Get(eventId int) ([]model.CommentResponse, error) {
	stmt, err := r.db.Prepare(`select c.id, c.userid, u.name, u.avatar, c.eventid, c.comment from comments c 
	join users u on c.userid = u.id where c.deleted_at is null and c.eventid =?`)
	if err != nil {
		log.Fatal(err)
	}

	var comments []model.CommentResponse

	result, err := stmt.Query(eventId)
	if err != nil {
		return comments, err
	}

	defer result.Close()

	for result.Next() {
		var comment model.CommentResponse
		err := result.Scan(&comment.ID, &comment.UserID, &comment.Name, &comment.Avatar, &comment.EventID, &comment.Comment)
		if err != nil {
			fmt.Println(err)
			log.Fatal("error di scan get comments")
		}
		comments = append(comments, comment)
	}
	return comments, nil
}

func (r *CommentRepository) Create(comment model.Comment) (model.Comment, error) {
	stmt, err := r.db.Prepare("INSERT INTO comments(userid, eventid, comment) VALUES(?,?,?)")
	if err != nil {
		log.Fatal(err)
	}

	result, err := stmt.Exec(comment.UserID, comment.EventID, comment.Comment)
	if err != nil {
		return comment, fmt.Errorf("gagal exec")
	}

	notAffected, _ := result.RowsAffected()
	if notAffected == 0 {
		return comment, fmt.Errorf("comment not created")
	}

	return comment, nil
}
