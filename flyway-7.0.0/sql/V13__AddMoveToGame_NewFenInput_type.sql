DROP PROCEDURE AddMoveToGame;

DELIMITER $$

CREATE PROCEDURE AddMoveToGame(
	IN gameIdInput VARCHAR(255),
	IN moveInput VARCHAR(10),
	IN newFenInput VARCHAR(255)
)
BEGIN

	SET @move_number = COALESCE((SELECT MAX(MoveNumber) FROM Moves WHERE Moves.GameId=gameIdInput), 0);

	INSERT INTO Moves
		(GameId, MoveNumber, Move)
	VALUES
		(gameIdInput, @move_number + 1, moveInput);

	UPDATE Games SET Fen = newFenInput WHERE Games.Id = gameIdInput;

END$$

DELIMITER ;