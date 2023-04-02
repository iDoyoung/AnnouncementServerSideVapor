import Vapor

func routes(_ app: Application) throws {
    
    app.group("announcements") { announcement in
        
        
        announcement.get{ req async -> [Announcement] in
            return []
        }
        
        announcement.get("recently") { req async -> Announcement in
            //TODO: read recently Announcement
            let announcement = Announcement(id: UUID(), title: "", content: "", date: Date())
            return announcement
        }
        
        announcement.post("item") { req in
            let announcement = try req.content.decode(Announcement.self)
            //TODO: Add announcement in DB
            return HTTPStatus.ok
        }
    }
}
