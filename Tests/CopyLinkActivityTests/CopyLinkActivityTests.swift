import XCTest
@testable import CopyLinkActivity

class CopyLinkActivityTests: XCTestCase {
    func testActivityType() {
        let activity1 = CopyLinkActivity()
        XCTAssertEqual(activity1.activityType, CopyLinkActivity.defaultActivityType)
        let activity2 = CopyLinkActivity(activityType: "test")
        XCTAssertEqual(activity2.activityType, UIActivity.ActivityType("test"))
    }

    func testActivityTitle() {
        let activity1 = CopyLinkActivity()
        XCTAssertEqual(activity1.activityTitle, "Copy Link")
        let activity2 = CopyLinkActivity(activityTitle: "Copy URL")
        XCTAssertEqual(activity2.activityTitle, "Copy URL")
    }

    func testActivityImage() {
        let activity = CopyLinkActivity()
        XCTAssertNotNil(activity.activityImage?.cgImage)
    }

    func testCanPerform() {
        let text = "test"
        let linkURL = URL(string: "https://www.apple.com/")!
        let activity = CopyLinkActivity()
        XCTAssertFalse(activity.canPerform(withActivityItems: [text]))
        XCTAssertTrue(activity.canPerform(withActivityItems: [linkURL]))
        XCTAssertTrue(activity.canPerform(withActivityItems: [text, linkURL]))
    }

    func testPerform() {
        let linkURL = URL(string: "https://www.apple.com/")!
        let activity = CopyLinkActivity()
        activity.prepare(withActivityItems: [linkURL])
        activity.perform()
        XCTAssertEqual(UIPasteboard.general.string, linkURL.absoluteString)
    }
}
