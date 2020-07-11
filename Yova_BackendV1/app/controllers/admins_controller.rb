class AdminsController < ApplicationController
    #Admin method for informing that a client notification was read: 
    def show 
        #Admin validation via admin signal send from frontend
        @admin = Admin.find(params[:adminID])
        if @admin
            #Search for client user: 
            @client = Client.find(params[:clientID])
            if @client 
                #Serve admin client notifications in DESC: 
                @notifications = Notification.all.order(date: :desc).where(client_id: @client[:id])
                render json: {notifications: @notifications}, status: 200
            end 
        end 
    end 


    #Admin method to create notifications for clients
    def create
        #Admin validation via admin signal sent from frontend:  
        @admin = Admin.find(params[:adminID])
        if @admin
            #Use Strong parameters to only require necessary fields for Notification model:          
            notificationParams = params.require(:notification).permit(:date, :title, :description, :client_id, :isRead)

            #Find appropriate user: 
            @client = Client.find(notificationParams[:client_id])

            #Client user validations: 
            if @client
                @newNotification = Notification.create(notificationParams)
                @newNotification.save
                render json: {message: 'Notification created and stored in database.'}, status: 200
            end
        end
    end
end
