import UIKit
import CopyLinkActivity

class ViewController: UIViewController {
    @IBAction func didTapShareButton(_ sender: UIButton) {
        let linkURL = URL(string: "https://www.apple.com/")!
        let activityViewController = UIActivityViewController(activityItems: [linkURL], applicationActivities: [CopyLinkActivity()])
        activityViewController.completionWithItemsHandler = { [weak self] (activityType, completed, _, _) -> Void in
            if completed && activityType == CopyLinkActivity.defaultActivityType {
                let alert = UIAlertController(title: "Copied", message: linkURL.absoluteString, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(alert, animated: true)
            }
        }
        present(activityViewController, animated: true)
    }
}
