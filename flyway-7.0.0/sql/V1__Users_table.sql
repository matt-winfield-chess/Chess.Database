CREATE TABLE Users
(
	Id INT NOT NULL AUTO_INCREMENT,
	Username VARCHAR(255) NOT NULL UNIQUE,
	PasswordHash VARCHAR(255) NOT NULL,
	PasswordSalt VARCHAR(255) NOT NULL,
	PRIMARY KEY (Id)
);