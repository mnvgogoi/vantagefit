//
// use in registering cell in tableviewcontroller
//
import UIKit

class UserDetailsViewPresenter{
    
    enum DetailComponent{
        case header, gender, dob, heightWeight, footer
        
        var identifier: String{
            switch self {
            case .header:
                return "TableViewHeader"
            case .gender:
                return "TableViewGendertwo"
            case .dob:
                return "TableViewDOB"
            case .heightWeight:
                return "TableViewHeightWeight"
            case .footer:
                return "TableViewFooterBtn"
            }
        }
        
        var nib: UINib{
            return UINib.init(nibName: self.identifier, bundle: Bundle.init(for: UserDetailsViewPresenter.self))
        }
    }
    
    static var allItems: [DetailComponent] = [.header, .gender, .dob, .heightWeight, .footer]
}
