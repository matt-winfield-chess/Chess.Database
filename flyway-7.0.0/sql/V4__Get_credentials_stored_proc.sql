DELIMITER $$

CREATE PROCEDURE GetUserCredentialsByUsername(
	IN usernameInput VARCHAR(255),
	OUT idOutput INT,
	OUT passwordHashOutput VARCHAR(255),
	OUT passwordSaltOutput VARCHAR(255)
)
BEGIN

	SELECT
		Id, PasswordHash, PasswordSalt
	INTO
		idOutput, passwordHashOutput, passwordSaltOutput
	FROM
		Users
	WHERE
		Users.Username = usernameInput;

END$$

DELIMITER ;