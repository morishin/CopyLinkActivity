# CopyLinkActivity

![Swift version](https://img.shields.io/badge/swift-3.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


UIActivity subclass for copying link URL to pasteboard

## Usage
[Example](https://github.com/morishin/CopyLinkActivity/tree/master/Example)
```swift
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
```

<img src="https://user-images.githubusercontent.com/1413408/33467848-094aaa38-d69b-11e7-8a55-2849abe7d8a3.gif" width="320"/>

## Installation
### Carthage
Cartfile

```
github "morishin/CopyLinkActivity"
```

### CocoaPods
Podfile

```ruby
pod 'CopyLinkActivity'
```

## LICENSE
MIT
