import UIKit
import WMF

@objc(WMFSaveButton) public class SaveButton: AlignedImageButton, AnalyticsContextProviding, AnalyticsContentTypeProviding {
    @objc(WMFSaveButtonState) enum State: Int {
        case shortSaved
        case longSaved
        case shortSave
        case longSave
    }

    static let saveImage = #imageLiteral(resourceName: "places-save").withRenderingMode(.alwaysTemplate)
    static let savedImage = #imageLiteral(resourceName: "places-unsave").withRenderingMode(.alwaysTemplate)
    
    public var analyticsContext = "unknown"
    public var analyticsContentType = "unknown"
    
    var saveButtonState: SaveButton.State = .shortSave {
        didSet {
            let saveTitle: String
            let saveImage: UIImage
            switch saveButtonState {
            case .longSaved:
                saveTitle = CommonStrings.savedTitle
                saveImage = SaveButton.savedImage
                accessibilityLabel = CommonStrings.accessibilitySavedTitle
            case .longSave:
                saveTitle = CommonStrings.saveTitle
                saveImage = SaveButton.saveImage
                accessibilityLabel = CommonStrings.saveTitle
            case .shortSaved:
                saveTitle = CommonStrings.shortSavedTitle
                saveImage = SaveButton.savedImage
                accessibilityLabel = CommonStrings.accessibilitySavedTitle
            case .shortSave:
                fallthrough
            default:
                saveTitle = CommonStrings.shortSaveTitle
                saveImage = SaveButton.saveImage
                accessibilityLabel = CommonStrings.saveTitle
            }
            UIView.performWithoutAnimation {
                setTitle(saveTitle, for: .normal)
                setImage(saveImage, for: .normal)
                layoutIfNeeded()
            }
        }
    }
}
