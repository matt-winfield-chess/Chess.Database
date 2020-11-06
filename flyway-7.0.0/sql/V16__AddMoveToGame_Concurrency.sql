DROP PROCEDURE IF EXISTS AddMoveToGame;

DELIMITER $$

CREATE PROCEDURE AddMoveToGame(
	IN gameIdInput VARCHAR(255),
	IN moveInput VARCHAR(10),
	IN newFenInput VARCHAR(255)
)
BEGIN

	SELECT MAX(MoveNumber) INTO @move_number 
		FROM Moves
		WHERE Moves.GameId=gameIdInput
		FOR UPDATE;

	INSERT INTO Moves
		(GameId, MoveNumber, Move)
	VALUES
		(gameIdInput, COALESCE(@move_number, 0) + 1, moveInput);

	UPDATE Games SET Fen = newFenInput WHERE Games.Id = gameIdInput;

END$$

DELIMITER ;