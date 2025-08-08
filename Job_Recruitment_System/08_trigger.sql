CREATE TABLE Notifications(
	notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    message TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- After Inserting into Applications → Add Notification
DELIMITER $$

CREATE TRIGGER trg_after_application_insert
AFTER INSERT ON Applications
FOR EACH ROW
BEGIN
	INSERT INTO Notifications(user_id, message)
    VALUES (NEW.user_id, CONCAT("You have successfully applied for job: ", NEW.job_id));
END $$

DELIMITER ;

-- After Deleting a Job → Delete Related Applications
DELIMITER $$

CREATE TRIGGER trg_after_job_delete
AFTER DELETE ON Jobs
FOR EACH ROW
BEGIN
	DELETE FROM Applications
    WHERE job_id = OLD.job_id;
END $$
DELIMITER ;