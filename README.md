<br/>

## Approach:
-REST API implemented through Ruby on Rails 5 and PostgreSQL 12.  

- API renders JSON responses to an assumed frontend, where JSON is parsed and inserted as necessary for functionalities.  

- Client id values are assumed provided via query parameter. 

- Admin id values are assumed provided via frontend request in a JSON based body of the client request. 

- Admin, Client, and Notification validations are provided in controller method as needed. 

<br/>

## Admin creation of Notifications for Clients: 

      /createNotification (POST) 
   <br/>
   
- **Controller Method:** create (Admins)
   
- **Function:** 
  - Allows admin to create a Notification instance for a specific client (specified in JSON body).   
   


<br/>

## Client uses REST API to get all their Notifications.    
   
    /:clientID/getNotifications (GET)
   <br/>
   
- **Controller Method:** show (Clients) 
   
- **Function:** 
  - Lets Client retrieve all their posts from database. 



<br/>

## Admin knows if new Notifications was seen by Client 
   
    /:clientID/readNotification/:notificationID (PATCH)   
    /:clientID/readNotifications (GET) 
   <br/>
   
- **Controller Methods:** 
  - update (Clients) 
  - show (Admins) 
                       
           
- **Functions**: 
  - Event driven reading of notification by client prompts an update to "isRead" column in the proper Notification instance in database via 1st route.  
  
  - "isRead" status of posts are used to dynamically update notifications of a client pulled up by an Admin, informing them of which notifications have been read by clients. 
  



