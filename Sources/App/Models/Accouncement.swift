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
    
    @Field(key: "date")
    var date: Date
    
    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt: Date?
    
    init() { }
    
    init(id: UUID, title: String, content: String, date: Date) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
    }
}

extension Announcement: Content { }
