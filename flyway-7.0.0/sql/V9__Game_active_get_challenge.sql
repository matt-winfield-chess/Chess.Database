ALTER TABLE Games ADD COLUMN Active BOOLEAN DEFAULT FALSE;

DROP PROCEDURE CreateGame;
DROP PROCEDURE GetGameById;

DELIMITER $$

CREATE PROCEDURE CreateGame(
	IN idInput VARCHAR(255),
	IN whitePlayerIdInput INT,
	IN blackPlayerIdInput INT
)
BEGIN

	INSERT INTO Games
		(Id, WhitePlayerId, BlackPlayerId, Active)
	VALUES
		(idInput, whitePlayerIdInput, blackPlayerIdInput, TRUE);

END$$

CREATE PROCEDURE GetGameById(
	IN idInput VARCHAR(255)
)
BEGIN

	SELECT
		Id, WhitePlayerId, BlackPlayerId, Active
	FROM
		Games
	WHERE
		Games.Id = idInput;

END$$

CREATE PROCEDURE GetChallenge(
	IN challengerIdInput INT,
	IN recipientIdInput INT
)
BEGIN

	SELECT
		ChallengerId, RecipientId, ChallengerColor
	FROM
		Challenges
	WHERE
		Challenges.ChallengerId = challengerIdInput AND Challenges.RecipientId = recipientIdInput;

END$$

DELIMITER ;