import Vapor

func routes(_ app: Application) throws {
            
    let announcementController = AnnouncementController()
    try app.register(collection: announcementController)
}
