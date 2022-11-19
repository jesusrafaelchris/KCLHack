import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
        
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // remove top line
        tabBar.tintColor = .white
        if #available(iOS 13.0, *) {
            // ios 13.0 and above
            let appearance = tabBar.standardAppearance
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            appearance.backgroundEffect = nil
            // need to set background because it is black in standardAppearance
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance

        } else {
            // below ios 13.0
            let image = UIImage()
            tabBar.shadowImage = image
            tabBar.backgroundImage = image
            // background
            tabBar.backgroundColor = .white
        }
}

// Tab Bar Specific Code
override func viewDidAppear(_ animated: Bool) {
    
    let home = HomeViewController()
    let homeimage = UIImage(systemName: "house")
    let homeselected = UIImage(systemName: "house.fill")
    home.tabBarItem =  UITabBarItem(title: "", image: homeimage, selectedImage: homeselected)
   
    // need to move this to custom button
    let groups = ChatViewController()
    let ticketImage = UIImage(systemName: "person.2")
    let ticketselected = UIImage(systemName: "person.2.fill")
    groups.tabBarItem = UITabBarItem(title: "", image: ticketImage, selectedImage: ticketselected)

    let trends = TrendsVC()
    let accountimage = UIImage(systemName: "chart.line.uptrend.xyaxis")
    let accountselected = UIImage(systemName: "chart.line.uptrend.xyaxis")
    trends.tabBarItem = UITabBarItem(title: "", image: accountimage, selectedImage: accountselected)

    let tabbarList = [home, groups, trends]
    
    viewControllers = tabbarList.map {
        UINavigationController(rootViewController: $0)
    }
 
    }
 }
