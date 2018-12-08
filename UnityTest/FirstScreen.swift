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

        button.setTitle("Play", for: .normal)

        return button
    }()

    lazy var unityView: UIView = {
        let view = UnityGetGLView()!

        view.alpha = 0

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        (UIApplication.shared.delegate as? AppDelegate)?.startUnity()

        view.backgroundColor = .white

        view.addSubview(dark)

        dark.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
            make.height.equalTo(60)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.view.addSubview(self.unityView)

            self.unityView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }

    @objc
    func didTapButton() {
        dark.snp.updateConstraints { make in
            make.centerY.equalToSuperview().offset(view.bounds.height)
        }

        UIView.animate(withDuration: 2) {
            self.unityView.alpha = 1

            self.view.layoutIfNeeded()
        }
    }
}
