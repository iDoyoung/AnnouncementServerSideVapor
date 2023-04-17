@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    
    func testAnnouncements() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        try app.test(.GET, "announcements" , afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
        })
    }
}
