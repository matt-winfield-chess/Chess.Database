CREATE TABLE Games
(
	Id VARCHAR(255),
	WhitePlayerId INT NOT NULL,
	BlackPlayerId INT NOT NULL,
	FOREIGN KEY (WhitePlayerId)
		REFERENCES Users(Id)
		ON DELETE CASCADE,
	FOREIGN KEY (BlackPlayerId)
		REFERENCES Users(Id)
		ON DELETE CASCADE,
	PRIMARY KEY (Id)
);

CREATE TABLE Moves
(
	GameId VARCHAR(255),
	MoveNumber INT NOT NULL,
	Move VARCHAR(10),
	FOREIGN KEY (GameId)
		REFERENCES Games(Id)
		ON DELETE CASCADE,
	PRIMARY KEY (GameId, MoveNumber)
);


DELIMITER $$

CREATE PROCEDURE CreateGame(
	IN idInput VARCHAR(255),
	IN whitePlayerIdInput INT,
	IN blackPlayerIdInput INT
)
BEGIN

	INSERT INTO Games
		(Id, WhitePlayerId, BlackPlayerId)
	VALUES
		(idInput, whitePlayerIdInput, blackPlayerIdInput);

END$$

CREATE PROCEDURE GetGameById(
	IN idInput VARCHAR(255)
)
BEGIN

	SELECT
		Id, WhitePlayerId, BlackPlayerId
	FROM
		Games
	WHERE
		Games.Id = idInput;

END$$

CREATE PROCEDURE AddMoveToGame(
	IN gameIdInput VARCHAR(255),
	IN moveInput VARCHAR(10)
)
BEGIN

	SET @move_number = COALESCE((SELECT MAX(MoveNumber) FROM Moves WHERE Moves.GameId=gameIdInput), 0);

	INSERT INTO Moves
		(GameId, MoveNumber, Move)
	VALUES
		(gameIdInput, @move_number + 1, moveInput);

END$$

CREATE PROCEDURE GetGameMovesById(
	IN gameIdInput VARCHAR(255)
)
BEGIN

	SELECT
		GameId, MoveNumber, Move
	FROM
		Moves
	WHERE
		Moves.GameId = gameIdInput;
	ORDER BY
		Moves.MoveNumber ASC

END$$

DELIMITER ;