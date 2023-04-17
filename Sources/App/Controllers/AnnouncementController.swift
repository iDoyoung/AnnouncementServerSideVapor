//
//  AnnouncementController.swift
//  
//
//  Created by Doyoung on 2023/04/03.
//

import Vapor

struct AnnouncementController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let announcementRoutes = routes.grouped("announcements")
        announcementRoutes.get(use: getAllHandler)
        announcementRoutes.post("announcement", use: createHandler)
    }
    
    func getAllHandler(_ req: Request) async throws -> [Announcement] {
        try await Announcement.query(on: req.db).all()
    }
    
    func createHandler(_ req: Request) async throws -> Announcement {
        let announcement = try req.content.decode(Announcement.self)
        try await announcement.save(on: req.db)
        return announcement
    }
}
