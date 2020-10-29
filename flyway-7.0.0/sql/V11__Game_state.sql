ALTER TABLE Games ADD COLUMN Fen VARCHAR(255) DEFAULT "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";

DROP PROCEDURE CreateGame;
DROP PROCEDURE GetGameById;
DROP PROCEDURE AddMoveToGame;

DELIMITER $$

CREATE PROCEDURE CreateGame(
	IN idInput VARCHAR(255),
	IN whitePlayerIdInput INT,
	IN blackPlayerIdInput INT,
	IN fenInput VARCHAR(255)
)
BEGIN

	INSERT INTO Games
		(Id, WhitePlayerId, BlackPlayerId, Active, Fen)
	VALUES
		(idInput, whitePlayerIdInput, blackPlayerIdInput, TRUE, fenInput);

END$$

CREATE PROCEDURE GetGameById(
	IN idInput VARCHAR(255)
)
BEGIN

	SELECT
		Id, WhitePlayerId, BlackPlayerId, Active, Fen
	FROM
		Games
	WHERE
		Games.Id = idInput;

END$$

CREATE PROCEDURE AddMoveToGame(
	IN gameIdInput VARCHAR(255),
	IN moveInput VARCHAR(10),
	IN newFenInput VARCHAR(10)
)
BEGIN

	SET @move_number = COALESCE((SELECT MAX(MoveNumber) FROM Moves WHERE Moves.GameId=gameIdInput), 0);

	INSERT INTO Moves
		(GameId, MoveNumber, Move)
	VALUES
		(gameIdInput, @move_number + 1, moveInput);

	UPDATE Games SET Fen = newFenInput WHERE GameId = gameIdInput;

END$$

DELIMITER ;