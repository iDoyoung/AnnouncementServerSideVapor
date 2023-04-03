//
//  AnnouncementController.swift
//  
//
//  Created by Doyoung on 2023/04/03.
//

import Vapor
import Fluent

struct AnnouncementController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let announcementRoutes = routes.grouped("announcements")
        announcementRoutes.get(use: getAllHandler)
        announcementRoutes.post("announcement", use: createHandler)
    }
    
    func getAllHandler(_ req: Request) -> EventLoopFuture<[Announcement]> {
        return Announcement.query(on: req.db).all()
    }
    
    func createHandler(_ req: Request) throws -> EventLoopFuture<Announcement> {
        let data = try req.content.decode(Announcement.self)
        let announcement = Announcement(title: data.title, content: data.content)
        return announcement.save(on: req.db).map { announcement }
    }
}
