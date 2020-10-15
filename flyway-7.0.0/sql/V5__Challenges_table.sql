CREATE TABLE Challenges
(
	ChallengerId INT NOT NULL,
	RecipientId INT NOT NULL,
	ChallengerColor INT,
	FOREIGN KEY (ChallengerId)
		REFERENCES Users(Id)
		ON DELETE CASCADE,
	FOREIGN KEY (RecipientId)
		REFERENCES Users(Id)
		ON DELETE CASCADE,
	PRIMARY KEY (ChallengerId, RecipientId)
);