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
        announcementRoutes.post("new", use: createHandler)
        announcementRoutes.delete(":id", use: deleteHandler)
    }
    
    func getAllHandler(_ req: Request) async throws -> [Announcement] {
        //FIXME: Be Better
//        let id = req.headers["X-Did-Client-Id"].first
//        if id != "TeStHeAdEr" {
//            throw Abort(.nonAuthoritativeInformation)
//        }
        return try await Announcement.query(on: req.db).all()
    }
    
    func createHandler(_ req: Request) async throws -> HTTPStatus {
        let announcement = try req.content.decode(Announcement.self)
//        let id = req.headers["X-Did-Client-Id"].first
//        if id != "TeStHeAdEr" {
//            throw Abort(.nonAuthoritativeInformation)
//        }
//        try await announcement.save(on: req.db)
        try await announcement.create(on: req.db)
        return .created
    }
    
    func deleteHandler(_ req: Request) async throws -> String {
        guard let announcement = try await Announcement.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await announcement.delete(on: req.db)
        return announcement.title
    }
}
