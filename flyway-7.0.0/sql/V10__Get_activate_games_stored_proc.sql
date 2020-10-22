DELIMITER $$

CREATE PROCEDURE GetActiveGames(
	IN userIdInput INT
)
BEGIN

	SELECT
		Id, WhitePlayerId, BlackPlayerId, Active
	FROM
		Games
	WHERE
		(Games.WhitePlayerId = userIdInput
		OR Games.BlackPlayerId = userIdInput)
		AND Active = TRUE;

END$$

DELIMITER ;