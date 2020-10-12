DELIMITER $$

CREATE PROCEDURE CreateUser(
	IN usernameInput VARCHAR(255),
	IN passwordHashInput VARCHAR(255),
	IN passwordSaltInput VARCHAR(255),
	OUT idOutput INT
)
BEGIN

	INSERT INTO Users
		(Username, PasswordHash, PasswordSalt)
	VALUES
		(usernameInput, passwordHashInput, passwordSaltInput);
	SET idOutput = LAST_INSERT_ID();

END$$

DELIMITER ;