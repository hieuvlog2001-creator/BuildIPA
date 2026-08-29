import UIKit
import WebKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let ws = scene as? UIWindowScene else { return }
        let vc = BankingViewController()
        let w = UIWindow(windowScene: ws)
        w.rootViewController = vc
        window = w
        w.makeKeyAndVisible()
    }
}
final class BankingViewController: UIViewController {
    let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        let resourceURL = Bundle.main.url(forResource: "index", withExtension: "html")
        let readURL = Bundle.main.resourceURL ?? Bundle.main.bundleURL
        if let url = resourceURL { webView.loadFileURL(url, allowingReadAccessTo: readURL) }
    }
}