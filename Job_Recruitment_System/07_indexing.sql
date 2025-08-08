CREATE INDEX idx_job_title ON Jobs(title);

CREATE INDEX idx_location ON Jobs(location);

CREATE INDEX idx_company_id ON Companies(company_id);

EXPLAIN SELECT * FROM Jobs WHERE title LIKE '%Developer%';

EXPLAIN ANALYZE SELECT * FROM Jobs WHERE title LIKE '%Developer%';
