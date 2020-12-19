ALTER TABLE Games ADD COLUMN DrawOffer VARCHAR(255) DEFAULT NULL;

DELIMITER $$

CREATE PROCEDURE OfferDraw
(
	IN gameIdInput VARCHAR(255),
	IN drawOfferColor VARCHAR(255)
)
BEGIN

	UPDATE Games
		SET DrawOffer = drawOfferColor
		WHERE Games.Id=gameIdInput;

END$$

CREATE PROCEDURE RemoveDrawOffer
(
	IN gameIdInput VARCHAR(255)
)
BEGIN

	UPDATE Games
		SET DrawOffer = NULL
		WHERE Games.Id=gameIdInput;

END$$

DELIMITER ;