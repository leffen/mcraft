
CREATE ROLE mcraft WITH PASSWORD '_BortiGranskauen2012_' LOGIN;


-- needed for rake to create dbs
ALTER USER mcraft CREATEDB;

--CREATE DATABASE bsqk_summer ENCODING 'UTF8' OWNER bsqk_summer;

-- restore of backup