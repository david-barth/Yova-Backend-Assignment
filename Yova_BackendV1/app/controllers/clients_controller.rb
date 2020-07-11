class ClientsController < ApplicationController
    #client method to update isRead status of a particular notification: 
    def update 
        #Find user via frontend directory structure: 
        @client = Client.find(params[:clientID])
        #Find relevant notification for user: 
        if @client 
            @notification = Notification.find(params[:notificationID])
            #Update database with new read status for selected notification: 
            notificationParams = params.require(:notification).permit(:isRead)
            notificationParams[:isRead] = true 
            @notification.update(notificationParams)
        end 
        render json: {message: "Notification was read by client"}, status: 200
    end 


    #Client method to retrieve all associated notifications: 
    def show
        #Query client user in database:  
        @client = Client.find(params[:clientID])
        
        if @client
            #Query associated client user notifications and return if found:  
            clientID = @client[:id]
            @notifications = Notification.where(client_id: clientID) 
            if @notifications != []
                render json: {notifications: @notifications}, code: 200
            end 
        end 
    end         
end
