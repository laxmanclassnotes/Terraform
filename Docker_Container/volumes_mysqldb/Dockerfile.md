FROM  myvoldb

# docker volume create myvol
# docker container run --name test1 -d -v myvol:/test alpine sleep 1d 
# docker container ls
# docker container exec test1 touch /test/{1..100}.txt
# docker container exec test1 ls /test/
# docker container rm -f test1

#  docker container run --name test2 -d -v myvol:/test alpine sleep 1d
#  docker container exec test2 ls /test/
# -------------------------------------------------------------------------


# creating volume and run mysql container 
# In these below line -v is for volume (myvol=source,/var/lib/mysql=destination )

# -----------------------------------------------------------------------------------

#  docker container run -d --name mysqldb -v myvol:/var/lib/mysql -P -e MYSQL_ROOT_PASSWORD=rootroot -e MYSQL_DATABASE=employees -e MYSQL_USER=laxman -e MYSQL_PASSWORD=rootroot mysql:8

# docker container exec -it mysqldb mysql --password=rootroot

# mysql> use employees;

# mysql>  CREATE TABLE Persons (
#             PersonID int,
#             LastName varchar(255),
#             FirstName varchar(255),
#             Address varchar(255),
#             City varchar(255)
#          );

#  mysql> Insert into Persons Values (1,'test','test','test','test');

#  mysql> Select * from Persons;
# -----------------------------------------------------------------

# --mount also used (in these to fetch the data into myvol)

#  docker container run -d --name mysqldb --mount "source=myvol,target=/var/lib/mysql,type=volume" -P -e MYSQL_ROOT_PASSWORD=rootroot -e MYSQL_DATABASE=employees -e MYSQL_USER=laxman -e MYSQL_PASSWORD=rootroot mysql:8 
 
# docker container exec -it mysqldb mysql --password=rootroot

# mysql> use employees; 

#  mysql> Select * from Persons;