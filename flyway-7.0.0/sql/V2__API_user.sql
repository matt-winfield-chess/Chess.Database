CREATE USER IF NOT EXISTS 'ApiUser'@'%' IDENTIFIED BY 'ApiPassword';

GRANT EXECUTE ON ChessDatabase.* TO 'ApiUser'@'%';