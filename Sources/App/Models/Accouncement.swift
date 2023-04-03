//
//  Announcement.swift
//  
//
//  Created by Doyoung on 2023/04/02.
//

import Vapor
import Fluent

final class Announcement: Model {
    
    static let schema = "announcements"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String

    @Field(key: "content")
    var content: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt: Date?
    
    init() { }
    
    init(id: UUID? = UUID(), title: String, content: String, createdAt: Date? = Date(), deletedAt: Date? = nil) {
        self.title = title
        self.content = content
        self.createdAt = createdAt
        self.deletedAt = deletedAt
    }
}

extension Announcement: Content { }
