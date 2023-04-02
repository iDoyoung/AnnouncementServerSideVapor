//
//  Announcement.swift
//  
//
//  Created by Doyoung on 2023/04/02.
//

import Vapor

struct Announcement: Content {
    let id: UUID
    let title: String
    let content: String
    let date: Date
}
