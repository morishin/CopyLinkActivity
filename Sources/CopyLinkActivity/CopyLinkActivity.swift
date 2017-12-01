import UIKit

public class CopyLinkActivity: UIActivity {
    public static let defaultActivityType = UIActivityType("me.morishin.activity.CopyLink")
    public static let defaultActivityImage: UIImage = {
        guard let image = UIImage(named: "copy_link_activity_icon", in: Bundle(for: CopyLinkActivity.self), compatibleWith: nil) else {
            assertionFailure("Failed to load image.")
            return UIImage()
        }
        return image
    }()

    private let _activityType: UIActivityType
    private let _activityImage: UIImage
    private let _activityTitle: String

    private var linkURL: URL?

    public init(
        activityType: String? = nil,
        activityTitle: String = "Copy Link",
        activityImage: UIImage = CopyLinkActivity.defaultActivityImage
    ) {
        _activityType = activityType.map { UIActivityType($0) } ?? CopyLinkActivity.defaultActivityType
        _activityTitle = activityTitle
        _activityImage = activityImage
        super.init()
    }

    public override static var activityCategory: UIActivityCategory {
        return .action
    }

    public override var activityType: UIActivityType? {
        return _activityType
    }

    public override var activityTitle: String? {
        return _activityTitle
    }

    public override var activityImage: UIImage? {
        return _activityImage
    }

    public override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return activityItems.contains { $0 is URL }
    }

    public override func prepare(withActivityItems activityItems: [Any]) {
        linkURL = activityItems.flatMap { $0 as? URL }.first
    }

    public override func perform() {
        if let linkURLString = linkURL?.absoluteString {
            UIPasteboard.general.string = linkURLString
            activityDidFinish(true)
        } else {
            activityDidFinish(false)
        }
    }
}
