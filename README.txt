Readme.txt
----------------------------------------------------------------------------------------
1. Description of the database

* This is a database to track independent pro wrestling promotions around the midwest. It
stores information about each person, who can fill the role of wrestler, manager, ring
announcer, etc.  I track promotions with information about their initials, full name, and
who is the person in charge (the promoter).  I also track venues (the name of the venue and
its address).  Thus, these are all inter-related since promotions host shows at different
venues on different days.  Each show has a number of matches ranging from 5 - 10 matches.  
And people (wrestlers) have matches, at the end of which they are either a winner or a
loser.  Or people can play a role in the show as a ring announer, or commentator.

* My data was mostly based on real information.  I've been to a handful of promotions in
the Iowa/Illinois region so I used the names of a few promotions, the wrestlers I've seen,
and the venues.  I did generate fake dates for the shows using mockaroo.com.  I simply made
7 matches per show, and then cycled through each good guy (face) and bad guy (heel) to
fill the person_has_match table.  I did make realistic data in the person_is_staff table,
but I only knew who those people were at one promotion, so it's not a very diverse set of
data.
-----------------------------------------------------------------------------------------
2. The grade I expect is an A (96-98).
* I have 8 tables with over 400 rows total
* I created 8 queries of the proper complexity
* I implemented all the queries in Python
* I made the Python interface somewhat nice, but not completely nice.

Note: on my choice #8 (deleting a role and seeing how the ON DELETE works), it works for
any role you delete, but my front end only displays the change on the person_is_staff table.
So pick roles like ring announcer or commentator.  Otherwise you'll have to query the
person_has_match table yourself if you delete a face, heel, or gimmick role.
-----------------------------------------------------------------------------------------
3. Challenges I faced:
* Figuring out the ER diagram was a challenge for me.  It forced me to really think about
relationships and association tables.  It was also challenging since it had to be done well
at the very beginning, since it would be a great hassle to change the design after all the
data has been input.