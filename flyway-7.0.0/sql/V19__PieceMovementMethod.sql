ALTER TABLE Users ADD COLUMN PieceMovementMethod INT DEFAULT 0;

DELIMITER $$

CREATE PROCEDURE GetUserPieceMovementMethod
(
	IN userIdInput INT
)
BEGIN

	SELECT PieceMovementMethod
		FROM Users
		WHERE Users.Id=userIdInput;

END$$

CREATE PROCEDURE SetUserPieceMovementMethod
(
	IN userIdInput INT,
	IN pieceMovementMethodInput INT
)
BEGIN

	UPDATE Users
		SET PieceMovementMethod = pieceMovementMethodInput
		WHERE Users.Id=userIdInput;

END$$

DELIMITER ;