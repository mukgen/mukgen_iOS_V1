import UIKit
import SnapKit
import Then

class ShowFilterCell: UICollectionViewCell {
    
    static let id = "customCell"
    
    var firstFilter = UIButton().then {
        $0.layer.cornerRadius = 100
        $0.backgroundColor = .red
        $0.setTitleColor(PresentationAsset.Colors.primaryLight1.color, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        $0.setTitle("전체", for: .normal)
    }
    
    var todayDate = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.text = "5월 10일"
        $0.textColor = PresentationAsset.Colors.pointBase.color
    }

    public var backView = UIImageView().then {
        $0.backgroundColor = .red

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(firstFilter)
        firstFilter.snp.makeConstraints {
            $0.width.equalTo(60)
            $0.height.equalTo(35.0)
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
            
        }
        
//        contentView.addSubview(tasteGoodText)
//        tasteGoodText.snp.makeConstraints {
//            $0.top.equalTo(pickText.snp.bottom).offset(20)
//            $0.left.equalToSuperview().offset(24)
//        }
//
//        contentView.addSubview(todayDate)
//        todayDate.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(20)
//            $0.left.equalTo(tasteGoodText.snp.right).offset(100)
//        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}