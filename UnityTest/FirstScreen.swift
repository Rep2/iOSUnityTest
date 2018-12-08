import SnapKit
import UIKit

class FirstScreen: UIViewController {
    lazy var dark: UIButton = {
        let button = UIButton(frame: .zero)

        button.backgroundColor = .blue

        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.white, for: .selected)

        button.titleLabel?.font = .systemFont(ofSize: 17)

        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true

        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(dark)

        dark.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
            make.height.equalTo(60)
        }
    }

    @objc
    func didTapButton() {
        UIView.transition(
            with: self.view,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: {
                self.present(ViewController(nibName: nil, bundle: nil), animated: true, completion: nil)
        },
            completion: { _ in
                UIView.setAnimationsEnabled(true)
        }
        )
    }
}
