								-- TRANSACTION

BEGIN; -- START TRANSACTION
	INSERT INTO Applications(user_id, job_id, applied_at)
	VALUES (3, 2, CURRENT_DATE);

	UPDATE Jobs 
	SET available_positions = available_positions - 1
	WHERE job_id = 2;
COMMIT;
-- ROLLBACK;

								-- CONCURRENCY
BEGIN;
	SELECT available_positions
	FROM Jobs
	WHERE job_id = 1
	FOR UPDATE;

	SAVEPOINT before_insert;

	INSERT INTO Applications (user_id, job_id, applied_at)
	VALUES (3, 1, CURRENT_DATE);

	UPDATE Jobs
	SET available_positions = available_positions - 1
	WHERE job_id = 1;

	
    RELEASE SAVEPOINT before_insert;
COMMIT;
-- ROLLBACK
