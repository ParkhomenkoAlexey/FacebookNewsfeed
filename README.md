# FacebookNewsfeed


## What I have done
/// 

## What you will learn

- [Setup application in code](#Setup-application-in-code)
- [Customizing the appearance of a Navigation Bar](#Customizing-the-appearance-of-a-Navigation-Bar)
- [Create and initialize UICollectionViewCell in code](#Create-and-initialize-UICollectionViewCell-in-code)
- [Make size of UICollectionViewCell in code](#Make-size-of-UICollectionViewCell-in-code)

## Setup application in code

#### AppDelegate file

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupUI(application: application)
        return true
    }
    
    func setupUI(application: UIApplication) {
        
        // get the window of the app
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        // UICollectionViewFlowLayout() - A concrete layout object that organizes items into a grid with optional header and footer views for each section.
        let newsfeedVC = NewsfeedVC(collectionViewLayout: UICollectionViewFlowLayout())
        // create navigation controller to be root VC of the window
        let navigationController = UINavigationController(rootViewController: newsfeedVC)
        window?.rootViewController = navigationController
    }
```
#### NewsfeedVC file
```swift
class NewsfeedVC: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        title = "Newsfeed"
    }
}
```

Then when application is running, a NewsfeedVC window will open.

## Customizing the appearance of a Navigation Bar

#### AppDelegate file
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // some NavigationBar changes
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.3130478561, green: 0.4422736466, blue: 0.6388198137, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        application.statusBarStyle = .lightContent
        return true
    }
```

Result:

![FacebookNewsfeed](https://github.com/ParkhomenkoAlexey/Images/blob/master/FacebookNewsfeed.png)

## Create and initialize UICollectionViewCell in code

#### NewsfeedCollectionViewCell file
```swift
class NewsfeedCollectionViewCell: UICollectionViewCell {

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    func setupUI() {
        self.backgroundColor = UIColor.gray
    }
}
```

#### Why we use this code?
```swift
override init(frame: CGRect) {
        super.init(frame: frame)
    }
```
  The new view object must be inserted into the view hierarchy of a window before it can be used. If you create a view object programmatically, this method is the designated initializer for the UIView class. Subclasses can override this method to perform any custom initialization but must call super at the beginning of their implementation.
  
  If you use Interface Builder to design your interface, this method is not called when your view objects are subsequently loaded from the nib file. Objects in a nib file are reconstituted and then initialized using their init(coder:) method, which modifies the attributes of the view to match the attributes stored in the nib file.
  
  After we `collectionView.register` this cell in UICollectionViewController (NewsfeedVC) we can observe such result:
  
  ![FacebookNewsfeed](https://github.com/ParkhomenkoAlexey/Images/blob/master/FacebookNewsfeed2.png)
  
## Make size of UICollectionViewCell in code

![FacebookNewsfeed](https://github.com/ParkhomenkoAlexey/Images/blob/master/FacebookNewsfeed3.png)

To do that we just need to add code below.
#### Extentions file

```swift
extension NewsfeedVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}
```

And make sure that in AppDelegate your UICollectionViewController initialize with UICollectionViewFlowLayout()

#### AppDelegate file
```swift
let newsfeedVC = NewsfeedVC(collectionViewLayout: UICollectionViewFlowLayout())
```
