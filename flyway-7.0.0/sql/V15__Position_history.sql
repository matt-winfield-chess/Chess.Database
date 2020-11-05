CREATE TABLE PositionsSinceIrreversibleMove
(
	GameId VARCHAR(255),
	Fen VARCHAR(255),
	FOREIGN KEY (GameId) REFERENCES Games(Id) ON DELETE CASCADE
);

DELIMITER $$

CREATE PROCEDURE AddPositionToGame
(
	IN gameIdInput VARCHAR(255),
	IN fenInput VARCHAR(255)
)
BEGIN

	INSERT INTO PositionsSinceIrreversibleMove
		(GameId, Fen)
	VALUES
		(gameIdInput, fenInput);

END$$

CREATE PROCEDURE GetPositionsFromIrreversibleMove
(
	IN gameIdInput VARCHAR(255)
)
BEGIN

	SELECT * FROM PositionsSinceIrreversibleMove
	WHERE
		PositionsSinceIrreversibleMove.GameId = gameIdInput;

END$$

CREATE PROCEDURE ClearGamePositionsFromIrreversibleMove
(
	IN gameIdInput VARCHAR(255)
)
BEGIN

	DELETE FROM PositionsSinceIrreversibleMove
	WHERE
		PositionsSinceIrreversibleMove.GameId = gameIdInput;

END$$

DELIMITER ;