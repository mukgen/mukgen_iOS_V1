import Foundation
import Presentation

public class ModuleFactory {
    public static let shared = ModuleFactory()
    private init() { }
}

extension ModuleFactory: ModuleFactoryInterface {
    public func TendiousVC() -> Presentation.TendinousViewController {
        let vc = TendinousViewController()
        return vc
    }
    
    public func NewMealPostVC() -> NewMealPostViewController {
        let vc = NewMealPostViewController()
        return vc
    }
    
    public func BoardVC() -> Presentation.BoardMainViewController {
        let vc = BoardMainViewController()
        return vc
    }
    
    public func DeliveryVC() -> Presentation.DeliveryViewController {
        let vc = DeliveryViewController()
        return vc
    }
    
    public func TapBarVC() -> Presentation.TapBarViewController {
        let vc = TapBarViewController()
        return vc
    }
    
    public func MainVC() -> Presentation.MainViewController {
        let vc = MainViewController()
        return vc
    }
    
    public func InputNameVC() -> Presentation.InputNicknameViewController {
        let vc = InputNicknameViewController()
        return vc
    }
    
    public func InputIdPasswordVC() -> Presentation.InputIdPasswordViewController {
        let vc = InputIdPasswordViewController()
        return vc
    }
}
