DELIMITER $$

CREATE PROCEDURE GetUserById(
	IN userIdInput INT
)
BEGIN

	SELECT
		Id, Username
	FROM
		Users
	WHERE
		Users.Id = userIdInput;

END$$

DELIMITER ;