DELIMITER $$

CREATE PROCEDURE GetChallengesByRecipient(
	IN userIdInput INT
)
BEGIN

	SELECT
		ChallangerId, RecipientId, WhitePlayer
	FROM
		Challenges
	WHERE
		Challenges.RecipientId = userIdInput;

END$$


CREATE PROCEDURE GetChallengesByChallenger(
	IN userIdInput INT
)
BEGIN

	SELECT
		ChallangerId, RecipientId, WhitePlayer
	FROM
		Challenges
	WHERE
		Challenges.ChallengerId = userIdInput;

END$$

CREATE PROCEDURE CreateChallenge(
	IN challengerIdInput INT,
	IN recipientIdInput INT,
	IN whitePlayerInput INT
)
BEGIN

	INSERT INTO
		Challenges (ChallengerId, RecipientId, WhitePlayer)
	VALUES
		(challengerIdInput, recipientIdInput, whitePlayerInput);

END$$

CREATE PROCEDURE DeleteChallenge(
	IN challengerIdInput INT,
	IN recipientIdInput INT
)
BEGIN

	DELETE FROM
		Challenges
	WHERE
		Challenges.ChallengerId = challengerIdInput AND Challenges.RecipientId = recipientIdInput;

END$$

DELIMITER ;