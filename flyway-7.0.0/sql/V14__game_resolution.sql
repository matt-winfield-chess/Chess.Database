ALTER TABLE Games
	ADD COLUMN Winner VARCHAR(255),
	ADD COLUMN WinnerId INT,
	ADD COLUMN Termination VARCHAR(1000),
	ADD FOREIGN KEY (WinnerId) REFERENCES Users(Id) ON DELETE SET NULL;

DROP PROCEDURE GetGameById;

DELIMITER $$

CREATE PROCEDURE GetGameById(
	IN idInput VARCHAR(255)
)
BEGIN

	SELECT
		Id, WhitePlayerId, BlackPlayerId, Active, Fen, Winner, WinnerId, Termination
	FROM
		Games
	WHERE
		Games.Id = idInput;

END$$

CREATE PROCEDURE SetGameResult(
	IN gameIdInput VARCHAR(255),
	IN winnerColorInput VARCHAR(255),
	IN winnerIdInput INT,
	IN terminationInput VARCHAR(1000)
)
BEGIN

	UPDATE
		Games
	SET
		Games.Winner=winnerColorInput,
		Games.WinnerId=winnerIdInput,
		Games.Termination=terminationInput,
		Games.Active=FALSE
	WHERE
		Games.Id = gameIdInput;

END$$

DELIMITER ;