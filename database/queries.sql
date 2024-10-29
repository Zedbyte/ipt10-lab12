CREATE TABLE Users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	complete_name VARCHAR(255),
	email VARCHAR(255) UNIQUE,
	password VARCHAR(255)
);

CREATE TABLE Questions (
	id INT AUTO_INCREMENT  PRIMARY KEY,
    	item_number INT NOT NULL,
    	question TEXT NOT NULL,
    	choices JSON NOT NULL,
    	correct_answer CHAR(1) NOT NULL,
    	CONSTRAINT chk_correct_answer CHECK (correct_answer IN ('A', 'B', 'C', 'D'))
);


CREATE TABLE exam_attempts (
    attempt_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    exam_items INT NOT NULL,
    exam_score INT NOT NULL,
    attempt_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);


CREATE TABLE users_answers (
    answer_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    attempt_id INT NOT NULL,
    answers JSON NOT NULL,
    date_answered DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (attempt_id) REFERENCES exam_attempts(attempt_id)
);





INSERT INTO questions
SET
item_number=1,
question="This mobile OS held the largest market share in 2012.",
choices='[{"letter": "A", "choice": "Android"}, {"letter": "B", "choice": "BlackBerry"}, {"letter": "C", "choice": "Symbian"}, {"letter": "D", "choice": "iOS"}]',
correct_answer='D';

INSERT INTO questions
SET
item_number=2,
question="What does GHz stand for?",
choices='[{"letter": "A", "choice": "Gigahertz"}, {"letter": "B", "choice": "Gigahotz"}, {"letter": "C", "choice": "Gigahetz"}, {"letter": "D", "choice": "Gigahatz"}]',
correct_answer='A';

INSERT INTO questions
SET
item_number=3,
question="When Gmail first launched, how much storage did it provide for your email?",
choices='[{"letter": "A", "choice": "1GB"}, {"letter": "B", "choice": "512MB"}, {"letter": "C", "choice": "5GB"}, {"letter": "D", "choice": "Unlimited"}]',
correct_answer='A';

INSERT INTO questions
SET
item_number=4,
question="The programming language 'Swift' was created to replace what other programming language?",
choices='[{"letter": "A", "choice": "Objective-C"}, {"letter": "B", "choice": "C#"}, {"letter": "C", "choice": "Ruby"}, {"letter": "D", "choice": "C++"}]',
correct_answer='A';

INSERT INTO questions
SET
item_number=5,
question="In computing, what does MIDI stand for?",
choices='[{"letter": "A", "choice": "Musical Instrument Digital Interface"}, {"letter": "B", "choice": "Musical Interface of Digital Instruments"}, {"letter": "C", "choice": "Modular Interface of Digital Instruments"}, {"letter": "D", "choice": "Musical Instrument Data Interface"}]',
correct_answer='A';
