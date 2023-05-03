@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    
    let mockAnnouncement = Announcement(title: "Test Announcement", content: "Unit Testing...")
    
    func testAnnouncements() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        try app.test(.GET, "announcements" , afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
        })
    }
    
    func test_createAnnouncement() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        try app.test(.POST, "announcements/new", beforeRequest: { req in
            try req.content.encode(mockAnnouncement)
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .created)
        })
    }
}
