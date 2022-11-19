import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
        
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // remove top line
        tabBar.tintColor = .white
        tabBar.backgroundColor = .black
}

// Tab Bar Specific Code
override func viewDidAppear(_ animated: Bool) {
    
    let home = HomeViewController()
    let homeimage = UIImage(systemName: "house")
    let homeselected = UIImage(systemName: "house.fill")
    home.tabBarItem =  UITabBarItem(title: "Home", image: homeimage, selectedImage: homeselected)
   
    // need to move this to custom button
    let groups = ChatViewController()
    let ticketImage = UIImage(systemName: "person.2")
    let ticketselected = UIImage(systemName: "person.2.fill")
    groups.tabBarItem = UITabBarItem(title: "Groups", image: ticketImage, selectedImage: ticketselected)

    let trends = TrendsVC()
    let accountimage = UIImage(systemName: "chart.line.uptrend.xyaxis")
    let accountselected = UIImage(systemName: "chart.line.uptrend.xyaxis")
    trends.tabBarItem = UITabBarItem(title: "Trends", image: accountimage, selectedImage: accountselected)

    let tabbarList = [home, groups, trends]
    
    viewControllers = tabbarList.map {
        UINavigationController(rootViewController: $0)
    }
 
    }
 }
