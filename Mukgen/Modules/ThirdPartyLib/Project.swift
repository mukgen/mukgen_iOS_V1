import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "ThirdPartyLib",
    dependencies: [
//        .SPM.Then,
//        .SPM.Kingfisher,
//        .SPM.SnapKit
        .external(name: "SnapKit"),
        .external(name: "Then")
    ]
)
