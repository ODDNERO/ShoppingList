
import UIKit

extension UITableViewController {
    func presentAlert(title: String, message: String?, removeButtonClicked: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let remove = UIAlertAction(title: "삭제", style: .destructive) { _ in removeButtonClicked() }
        
        alert.addAction(cancel)
        alert.addAction(remove)
        present(alert, animated: true)
    }
}

