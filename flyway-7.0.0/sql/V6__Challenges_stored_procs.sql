DELIMITER $$

CREATE PROCEDURE GetChallengesByRecipient(
	IN userIdInput INT
)
BEGIN

	SELECT
		ChallengerId, RecipientId, ChallengerColor
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
		ChallengerId, RecipientId, ChallengerColor
	FROM
		Challenges
	WHERE
		Challenges.ChallengerId = userIdInput;

END$$

CREATE PROCEDURE CreateChallenge(
	IN challengerIdInput INT,
	IN recipientIdInput INT,
	IN challengerColorInput INT
)
BEGIN

	INSERT INTO
		Challenges (ChallengerId, RecipientId, ChallengerColor)
	VALUES
		(challengerIdInput, recipientIdInput, ChallengerColor);

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