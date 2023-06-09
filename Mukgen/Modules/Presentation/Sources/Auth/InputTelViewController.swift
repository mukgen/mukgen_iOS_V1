import UIKit
import SnapKit
import Then
import MukgenKit
import Core

final class InputTelViewController: BaseVC {
    
    private let inputNicknameLabel = UILabel().then {
        $0.text = "전화번호를 입력해주세요."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let useInDeilivery = UILabel().then {
        $0.text = "배달 파티 모집 시 사용됩니다."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    private let minusLabel = UILabel().then {
        $0.text = "-"
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private let minusLabel1 = UILabel().then {
        $0.text = "-"
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private let attributes = [NSAttributedString.Key.foregroundColor: PresentationAsset.Colors.primaryLight2.color,
                          .font : UIFont.systemFont(ofSize: 20, weight: .semibold)]
    
    private var firstTextField = UITextField().then {
        $0.textAlignment = .center
        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.textColor = .black
    }
    
    private var secondTextField = UITextField().then {
        $0.textAlignment = .center
        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private var thirdTextField = UITextField().then {
        $0.textAlignment = .center

        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private var firstLine = UIView().then {
        $0.backgroundColor = PresentationAsset.Colors.primaryLight2.color
    }
    
    private var secondLine = UIView().then {
        $0.backgroundColor = PresentationAsset.Colors.primaryLight2.color
    }
    
    private var thirdLine = UIView().then {
        $0.backgroundColor = PresentationAsset.Colors.primaryLight2.color
    }
   
    private let nextPageButton = CustomButton(title: "다음",
                                      backgroundColor: PresentationAsset.Colors.primaryLight2.color, titleColor: .white,
                                   font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    )
    
    override func layout() {
        
        [
            inputNicknameLabel,
            useInDeilivery,
            firstTextField,
            firstLine,
            minusLabel,
            secondTextField,
            secondLine,
            minusLabel1,
            thirdTextField,
            thirdLine,
            nextPageButton
        ].forEach { view.addSubview($0) }

        inputNicknameLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(123)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(29)
        }
        
        useInDeilivery.snp.makeConstraints() {
            $0.top.equalTo(inputNicknameLabel.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(17)
        }
        
        firstTextField.snp.makeConstraints() {
            $0.top.equalTo(useInDeilivery.snp.bottom).offset(24)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(98)
            $0.height.equalTo(56)
        }
        
        firstLine.snp.makeConstraints() {
            $0.top.equalTo(firstTextField.snp.bottom).offset(0)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(98)
            $0.height.equalTo(2)
        }
        
        minusLabel.snp.makeConstraints() {
            $0.top.equalTo(useInDeilivery.snp.bottom).offset(40)
            $0.left.equalTo(firstTextField.snp.right).offset(10)
            $0.width.equalTo(9)
            $0.height.equalTo(24)
        }
        
        secondTextField.snp.makeConstraints() {
            $0.top.equalTo(useInDeilivery.snp.bottom).offset(24)
            $0.left.equalTo(minusLabel.snp.right).offset(10)
            $0.width.equalTo(98)
            $0.height.equalTo(56)
        }
        
        secondLine.snp.makeConstraints() {
            $0.top.equalTo(secondTextField.snp.bottom).offset(0)
            $0.left.equalTo(minusLabel.snp.right).offset(10)
            $0.width.equalTo(98)
            $0.height.equalTo(2)
        }
        
        minusLabel1.snp.makeConstraints() {
            $0.top.equalTo(useInDeilivery.snp.bottom).offset(40)
            $0.left.equalTo(secondTextField.snp.right).offset(10)
            $0.width.equalTo(9)
            $0.height.equalTo(24)
        }
        
        thirdTextField.snp.makeConstraints() {
            $0.top.equalTo(useInDeilivery.snp.bottom).offset(24)
            $0.left.equalTo(minusLabel1.snp.right).offset(10)
            $0.width.equalTo(98)
            $0.height.equalTo(56)
        }
        
        thirdLine.snp.makeConstraints() {
            $0.top.equalTo(thirdTextField.snp.bottom).offset(0)
            $0.left.equalTo(minusLabel1.snp.right).offset(10)
            $0.width.equalTo(98)
            $0.height.equalTo(2)
        }
        
        nextPageButton.snp.makeConstraints() {
            $0.top.equalTo(secondTextField.snp.bottom).offset(502)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(353)
            $0.height.equalTo(55)
        }
    }
    
    override func attribute() {
        view.backgroundColor = .white
        
        lazy var textFields = [firstTextField, secondTextField, thirdTextField]
        let placeholders = ["", "", ""]
        
        var index = 0
        for textField in textFields {
            textField.attributedPlaceholder = NSAttributedString(string: placeholders[index],
                                                                 attributes: attributes)
            textField.delegate = self
            index += 1
        }
    }
    
    func animate(line: UIView) {
        line.alpha = 0.3
        UIView.animate(withDuration: 1) {
            line.alpha = 1
        }
    }
    
}


extension InputTelViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case firstTextField:
            animate(line: firstLine)
            firstLine.backgroundColor =  PresentationAsset.Colors.pointBase.color
        case secondTextField:
            animate(line: secondLine)
            secondLine.backgroundColor =  PresentationAsset.Colors.pointBase.color
        case thirdTextField:
            animate(line: thirdLine)
            thirdLine.backgroundColor =  PresentationAsset.Colors.pointBase.color
        
        default: return
        }
    }
}
