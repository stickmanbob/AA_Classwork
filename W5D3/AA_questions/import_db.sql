PRAGMA foreign_keys = ON;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255),
    lname VARCHAR(255)
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    body TEXT,
    author_id INTEGER,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)

);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    subject_question INTEGER,
    parent_reply INTEGER,
    author_id INTEGER,
    body TEXT,

    FOREIGN KEY(subject_question) REFERENCES questions(id),
    FOREIGN KEY(parent_reply) REFERENCES replies(id),
    FOREIGN KEY(author_id) REFERENCES users(id)
);


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)

);


INSERT INTO 
    users(fname, lname)
VALUES
    ('Bob', 'Jones'),
    ('John', 'Doe'),
    ('emily', 'schmaryahoo'),
    ('user','four');


INSERT INTO
    questions(title, body, author_id)
VALUES
    ('test', 'testestestest', 1),
    ('question2','CTHULHU FTAGN"!FDFJDFJEWOIDSFDSLKFNESOIEFJOE',2),
    ('question3','what is the meanring of life?',2);


INSERT INTO
    replies 
    (subject_question, parent_reply, author_id, body)
VALUES
    (1, NULL, 1, "I replied to myself!"),
    (2,NULL,3,'what a great question!'),
    (3,NULL,3,'bottom text'),
    (1,1,4,'nested reply!');



INSERT INTO
    question_follows
    (user_id,question_id)
VALUES
 (4,3),
 (3,3),
 (2,1),
 (4,2);

 INSERT INTO 
    question_likes
    (user_id,question_id)
  VALUES 
    (1,2),
    (1,3),
    (3,1),
    (2,1);

