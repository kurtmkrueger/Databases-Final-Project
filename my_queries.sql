-- Level 1 SQL Statements -----------------------------------------------------------
-- Query 1
-- returns the full name of each promotion
SELECT promotion_initials, promotion_name
FROM wrestling.promotion
WHERE promotion_initials = "scw";

-- Query 2: 
-- returns name of promoter of each promotion (if known)
SELECT person.first_name, person.last_name
FROM wrestling.person
INNER JOIN wrestling.promotion
ON promotion.promoter = person.person_id;

-- Query 3
-- return names of wrestlers who have never won a match.
SELECT person.first_name, person.last_name
FROM person
WHERE NOT EXISTS (
	SELECT *
    FROM person_has_match
    WHERE person.person_id = person_has_match.person_id AND person_has_match.winner = 1
) AND EXISTS (
	SELECT *
    FROM person_has_match
    WHERE person.person_id = person_has_match.person_id AND person_has_match.role_id IN (
		SELECT role.role_id
		FROM role
		WHERE role.role_description IN ("face", "heel", "gimmick")
	)
);
    
-- Query 4
-- returns name of each wrestler with total number of wins in their career
SELECT person.first_name, person.last_name, SUM(person_has_match.winner) AS total_wins
FROM person
INNER JOIN person_has_match
ON person.person_id = person_has_match.person_id
WHERE person_has_match.person_id = 1
GROUP BY person.first_name, person.last_name
ORDER BY total_wins DESC;

-- Level 2 SQL Statements --------------------------------------------------------------------
-- Insert row
-- inserts a new venue location to the venue table
INSERT INTO venue (venue.venue_name, venue.venue_address, venue.venue_town, venue.venue_state, venue.venue_zip)
VALUES ("bierstube", "123 main st", "moline", "il", 12345);

-- Delete row
-- deletes a venue location from the venue table
DELETE FROM venue
WHERE venue.venue_name = "bierstube";

-- Foreign key ON UPDATE
-- updates a show date, and displays how that update cascades to a match
-- display the "before" state of the show table
SELECT wrestling.show.promotion_id, wrestling.show.show_date, wrestling.show.venue_id
FROM wrestling.show
ORDER BY wrestling.show.show_date;
-- display the "before" state of match table
SELECT wrestling.match.match_num, wrestling.match.promotion_id, wrestling.match.show_date
FROM wrestling.match
ORDER BY wrestling.match.show_date, wrestling.match.match_num
LIMIT 15;
-- alter the date in the show table
UPDATE wrestling.show
SET wrestling.show.show_date = "2016-12-04"
WHERE wrestling.show.show_date = "2021-12-04";
-- display the "after" state of the show table
SELECT wrestling.show.promotion_id, wrestling.show.show_date, wrestling.show.venue_id
FROM wrestling.show
ORDER BY wrestling.show.show_date;
-- display the "after" state of the match table
SELECT wrestling.match.match_num, wrestling.match.promotion_id, wrestling.match.show_date
FROM wrestling.match
ORDER BY wrestling.match.show_date, wrestling.match.match_num
LIMIT 15;
-- undo the change
UPDATE wrestling.show
SET wrestling.show.show_date = "2021-12-04"
WHERE wrestling.show.show_date = "2016-12-04";

-- Foreign key ON DELETE
-- deletes a role and displays how that deletion sets to NULL to person_is_staff
-- displays the "before"state of the role table
SELECT *
FROM wrestling.role
ORDER BY wrestling.role.role_id;
-- displays the "before" state of the person_is_staff table
SELECT *
FROM wrestling.person_is_staff
ORDER BY wrestling.person_is_staff.role_id;
-- delete "commentator" from role table
DELETE FROM wrestling.role
WHERE wrestling.role.role_description = "commentator";
-- displays the "before"state of the role table
SELECT *
FROM wrestling.role
ORDER BY wrestling.role.role_id;
-- displays the "after" state of the person_is_staff table
SELECT *
FROM wrestling.person_is_staff
ORDER BY wrestling.person_is_staff.role_id;
-- adds "commentator" back into role table
INSERT INTO wrestling.role (wrestling.role.role_description)
VALUES ("commentator");
-- updates all the NULL values in person_is_staff table to commentator role
UPDATE person_is_staff
SET person_is_staff.role_id = 
	(SELECT wrestling.role.role_id
    FROM wrestling.role
    WHERE wrestling.role.role_description = "commentator")
WHERE person_is_staff.role_id IS NULL;
