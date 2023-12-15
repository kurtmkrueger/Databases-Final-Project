"""
File: front_end.py
Author: Kurt Krueger
Description: front end for wrestling database
"""

import mysql.connector as mysql

def connect(password_str):
    db = mysql.connect(
        host = "localhost",
        user = "root",
        passwd = password_str,
        database = "wrestling"
    )
    return db

def showData(records):
    for record in records:
        ## Each record is a tuple of row
        ## Chage to print(record[1]) to get the category name only
        print(record)
    return None

## -----------------------------------------------------------------------------------
## 1. get promotion name
## -----------------------------------------------------------------------------------
def getPromotion(db):
    """ Basic example of running a query """
    cursor = db.cursor()

    ## defining the query
    promotion_initials = input("Enter initials of promotion: ").lower().strip()
    query = ("SELECT promotion_initials, promotion_name "
             "FROM wrestling.promotion "
             "WHERE promotion.promotion_initials = %s;")
    data = (promotion_initials,)

    ## execute the query
    cursor.execute(query, data)

    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())

    ## Close the cursor
    print("----------------------------------------------")
    cursor.close()
    return None

## -----------------------------------------------------------------------------------
## 2. get promoter's name
## -----------------------------------------------------------------------------------
def getPromoter(db):
    """Example of using query parameters to change your query."""
    
    cursor = db.cursor()

    ## defining the Query
    promotion_initials=input("Enter the promotion initials: ").lower().strip()
    query = ('SELECT person.first_name, person.last_name '
             'FROM wrestling.person '
             'INNER JOIN wrestling.promotion '
             'ON promotion.promoter = person.person_id '
             'WHERE promotion.promotion_initials = %s;')
    data = (promotion_initials,)

    ## execute the query
    cursor.execute(query,data)

    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())

    ## Close the cursor
    print("----------------------------------------------")
    cursor.close()
    return None

## -----------------------------------------------------------------------------------
## 3. get wrestlers with no wins
## -----------------------------------------------------------------------------------
def getNoWins(db):
    """returns list of all wrestlers that never won a match"""
    cursor = db.cursor()

    ## defining the query
    query = ("SELECT person.first_name, person.last_name "
             "FROM person "
             "WHERE NOT EXISTS ( "
             "  SELECT * "
             "  FROM person_has_match "
             "  WHERE person.person_id = person_has_match.person_id AND "
             "  person_has_match.winner = 1 "
             ") AND EXISTS ("
             "  SELECT *"
             "  FROM person_has_match "
             "  WHERE person.person_id = person_has_match.person_id AND "
             "  person_has_match.role_id IN ("
             "    SELECT role.role_id "
             "    FROM role "
             '    WHERE role.role_description IN ("face", "heel", "gimmick") '
             "  ) "
             ");")

    ## execute the query
    cursor.execute(query,)

    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())

    ## Close the cursor
    print("----------------------------------------------")
    cursor.close()
    return None

## -----------------------------------------------------------------------------------
## 4. get wrestler wins
## -----------------------------------------------------------------------------------
def getWins(db):
    """ returns name of wrestler with total number of wins in their career """
    cursor = db.cursor()

    ## ask user for wrestler's name
    wrestler_name = input("Enter full name of wrestler (first last): ").lower().split()

    ## check to see if the wrester has only a first name.
    ## if so, set a null value to their last name.
    if len(wrestler_name) == 1:
        data = (wrestler_name[0], None)
    ## otherwise, if the wrestler has both a first and last name, set data to each.
    else:
        data = (wrestler_name[0], wrestler_name[1])
        
    ## defining the query
    query = ("SELECT person.first_name, person.last_name, "
             "SUM(person_has_match.winner) AS total_wins "
             "FROM person "
             "INNER JOIN person_has_match "
             "ON person.person_id = person_has_match.person_id "
             "WHERE person.person_id = "
             "  (SELECT person.person_id "
             "  FROM person "
             "  WHERE person.first_name = %s AND (person.last_name = %s "
             "  OR person.last_name IS NULL) "
             ") "
             "GROUP BY person.first_name, person.last_name;")

    ## execute the query
    cursor.execute(query, data)

    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())

    ## Close the cursor
    print("----------------------------------------------")
    cursor.close()
    return None

## -----------------------------------------------------------------------------------
## 5. insert venue
## -----------------------------------------------------------------------------------
def insertVenue(db):
    """ inserts a new venue into the venue table """
    cursor = db.cursor()

    ## defining the query
    venue_name = input("Enter name of new venue: ").lower().strip()
    venue_address = input("Enter address of new venue: ").lower().strip()
    venue_town = input("Enter town of new venue: ").lower().strip()
    venue_state = input("Enter state (two characters) of new venue: ").lower().strip()
    venue_zip = int(input("Enter zip code of new venue: "))

    query = ("INSERT INTO venue (venue.venue_name, venue.venue_address, "
             "venue.venue_town, venue.venue_state, venue.venue_zip) "
             "VALUES (%s, %s, %s, %s, %s); ")
    data = (venue_name, venue_address, venue_town, venue_state, venue_zip)

    ## execute insertion into the database
    print("inserting...")
    cursor.execute(query, data)
    print("insert complete!")
    
    ## display the updated records from the table
    print("(preview of updated venue table...)")
    query = ("SELECT * "
             "FROM wrestling.venue;")
    cursor.execute(query,)
    
    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())

    ## ask the user if they want to commit the changes or cancel
    if input("Commit? y/n: ").lower().strip() == "y":
        print("committed")
        db.commit()
    else:
        print("cancelled")

    ## Close the cursor
    print("----------------------------------------------")
    cursor.close()
    return None

## -----------------------------------------------------------------------------------
## 6. delete venue
## -----------------------------------------------------------------------------------
def deleteVenue(db):
    """ inserts a new venue into the venue table """
    cursor = db.cursor()

    ## defining the query
    venue_name = input("Enter name of venue to delete: ").lower().strip()
    query = ("DELETE FROM venue "
             "WHERE venue.venue_name = %s;")
    data = (venue_name,)

    ## execute deletion from the database
    print("deleting...")
    cursor.execute(query, data)
    print("delete complete!")
    
    ## display the updated records from the table
    print("(preview of updated venue table...)")
    query = ("SELECT * "
             "FROM wrestling.venue;")
    cursor.execute(query,)
    
    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())

    ## ask the user if they want to commit the changes or cancel
    if input("Commit? y/n: ").lower().strip() == "y":
        print("committed")
        db.commit()
    else:
        print("cancelled")

    ## Close the cursor
    print("----------------------------------------------")
    cursor.close()
    return None

## -----------------------------------------------------------------------------------
## 7. update show date
## -----------------------------------------------------------------------------------
def updateShowDate(db):
    """ updates a show date and displays how that update cascades to a match """
    cursor = db.cursor()
    ## ----------------------
    ## display initial show table:
    print("Here is the initial table of shows")
    query = ("SELECT wrestling.promotion.promotion_initials, "
             "wrestling.show.show_date, wrestling.venue.venue_name "
             "FROM wrestling.show "
             "INNER JOIN wrestling.promotion "
             "ON wrestling.promotion.promotion_id = wrestling.show.promotion_id "
             "INNER JOIN wrestling.venue "
             "ON wrestling.show.venue_id = wrestling.venue.venue_id "
             "ORDER BY wrestling.show.show_date;")
    cursor.execute(query,)
    
    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())
    
    ## ----------------------
    ## update:
    ## defining the query
    promotion_initials = input("Enter promotion's initials of that show: ").lower().strip()
    old_date = input("Enter old date of show (yyyy-mm-dd): ").lower().strip()
    new_date = input("Enter new date of show (yyyy-mm-dd): ").lower().strip()

    query = ("UPDATE wrestling.show "
             "SET wrestling.show.show_date = %s "
             "WHERE wrestling.show.show_date = %s AND "
             "wrestling.show.promotion_id = "
             "  (SELECT promotion.promotion_id "
             "  FROM wrestling.promotion "
             "  WHERE promotion.promotion_initials = %s "
             ");")
    data = (new_date, old_date, promotion_initials)

    ## execute the update to the database
    print("updating...")
    cursor.execute(query, data)
    print("update complete!")
    
    ## ----------------------    
    ## preview the updated show table:
    print("(preview of updated show table...)")
    query = ("SELECT wrestling.promotion.promotion_initials, wrestling.show.show_date, "
             "wrestling.venue.venue_name "
             "FROM wrestling.show "
             "INNER JOIN wrestling.promotion "
             "ON wrestling.promotion.promotion_id = wrestling.show.promotion_id "
             "INNER JOIN wrestling.venue "
             "ON wrestling.venue.venue_id = wrestling.show.venue_id "
             "ORDER BY wrestling.show.show_date;")
    cursor.execute(query,)
    
    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())

    print("(preview of updated match table...)")
    query = ("SELECT wrestling.promotion.promotion_initials, "
             "wrestling.match.show_date, wrestling.match.match_num "
             "FROM wrestling.match "
             "INNER JOIN wrestling.promotion "
             "ON wrestling.promotion.promotion_id = wrestling.match.promotion_id "
             "WHERE wrestling.match.show_date = %s "
             "ORDER BY wrestling.match.show_date, wrestling.match.match_num;")
    data = (new_date,)
    cursor.execute(query, data)

    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())
    
    ## ----------------------
    ## commit the changes or cancel:
    if input("Commit? y/n: ").lower().strip() == "y":
        print("committed")
        db.commit()
    else:
        print("cancelled")

    ## Close the cursor
    print("----------------------------------------------")
    cursor.close()
    return None

## -----------------------------------------------------------------------------------
## 8. delete role
## -----------------------------------------------------------------------------------
def deleteRole(db):
    """ updates a show date and displays how that update cascades to a match """
    cursor = db.cursor()
    ## ----------------------
    ## display initial role table:
    print("Here is the initial role table")
    query = ("SELECT * "
             "FROM wrestling.role "
             "ORDER BY wrestling.role.role_id;")
    cursor.execute(query,)
    
    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())
    
    ## ----------------------
    ## delete:
    ## defining the query
    role = input("Enter the role to delete:  ").lower().strip()

    query = ("DELETE FROM wrestling.role "
             "WHERE wrestling.role.role_description = %s;")
    
    ## note that data MUST be a tuple!  To make a single item tuple, use parenthesis
    ## and put a comma at the end.
    data = (role,)

    ## execute deletion from the database
    print("deleting...")
    cursor.execute(query, data)
    print("delete complete!")
    
    ## ----------------------   
    ## preview the updated tables:
    print("here is a preview of the updated role table...")
    query = ("SELECT * "
             "FROM wrestling.role "
             "ORDER BY wrestling.role.role_id;")
    cursor.execute(query,)
    
    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())

    print("(preview of updated person_is_staff table...)")
    query = ("SELECT promotion.promotion_initials, person_is_staff.show_date, "
             "person.first_name, person.last_name, role.role_description "
             "FROM wrestling.person_is_staff "
             "LEFT JOIN wrestling.promotion "
             "ON promotion.promotion_id = person_is_staff.promotion_id "
             "LEFT JOIN wrestling.person "
             "ON person.person_id = person_is_staff.person_id "
             "LEFT JOIN wrestling.role "
             "ON role.role_id = person_is_staff.role_id "
             "ORDER BY person_is_staff.show_date;")
    cursor.execute(query,)
    
    ## show the data fetched from the 'cursor' object
    showData(cursor.fetchall())
    
    ## ----------------------
    ## commit the changes or cancel:
    if input("Commit? y/n: ").lower().strip() == "y":
        print("committed")
        db.commit()
    else:
        print("cancelled")

    ## Close the cursor
    print("----------------------------------------------")
    cursor.close()
    return None

## -----------------------------------------------------------------------------------
## main program
## -----------------------------------------------------------------------------------
def main():
    """ Example of putting everything together."""
    
    ## Connect once to get the db connection
    print("Connecting to the database...")
    password_str = input("Enter password: ")
    db = connect(password_str)

    ## Do queries
    entry = 0
    while entry != 9:
        entry = int(input("Enter a number:\n"
                          "1. get promotion name\n"
                          "2. get promoter's name\n"
                          "3. get wrestlers with no wins\n"
                          "4. get wrestler wins\n"
                          "5. insert venue\n"
                          "6. delete venue\n"
                          "7. update show date\n"
                          "8. delete role\n"
                          "9. quit\n"))
        match entry:
            case 1:
                getPromotion(db)
            case 2:
                getPromoter(db)
            case 3:
                getNoWins(db)
            case 4:
                getWins(db)
            case 5:
                insertVenue(db)
            case 6:
                deleteVenue(db)
            case 7:
                updateShowDate(db)
            case 8:
                deleteRole(db)

## -----------------------------------------------------------------------------------
## run the main program
## -----------------------------------------------------------------------------------
main()

