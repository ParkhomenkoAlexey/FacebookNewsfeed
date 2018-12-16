# FacebookNewsfeed

Facebook Newsfeed from scratch all programmatically without using the Storyboard. Go over exactly how to layout every cell's subview by using VisualFormatLanguage. Extensions will be used to make adding constraints much easier. By the time you complete the project, you'll have the perfect understanding of how to construct your views for the perfect layout.

## What I have done
 
![FacebookNewsfeed](https://github.com/ParkhomenkoAlexey/Images/blob/master/FacebookNewsfeed5.gif)
## What you will learn
    
- [Setup application in code](#Setup-application-in-code)
- [Customizing the appearance of a Navigation Bar](#Customizing-the-appearance-of-a-Navigation-Bar)
- [Working with UICollectionViewCell](#Create-and-initialize-UICollectionViewCell-in-code)
    - [Create and initialize UICollectionViewCell in code](#Create-and-initialize-UICollectionViewCell-in-code) 
    - [Make const size of UICollectionViewCell in code](#Make-const-size-of-UICollectionViewCell-in-code) 
    - [Add elements to the cell and fix them using VisualFormat](#Add-elements-to-the-cell-and-fix-them-using-VisualFormat)
    - **[Dymanic change UICollectionViewCell size](#Dymanic-change-UICollectionViewCell-size)** 
        - [How to Resize Textview Dynamically](#Dymanic-change-UICollectionViewCell-size)
        - [Sizing UITableView Cells to Fit Images](#Dymanic-change-UICollectionViewCell-size)

    
 ## How this application will be improved
 
- Add TabBarController to include another functions such as "friend requests"
- Get real data(posts) by using API.
- Make posts only with a post image or with post text only.
- Restrict text size with the "show full" button if it exceeds the size of three lines of the screen.    

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
  
## Make const size of UICollectionViewCell in code

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
And make sure that your `UICollectionViewController` initialize with `UICollectionViewFlowLayout()`

Because in my app UICollectionViewController is a rootViewController this is described as follows:
#### AppDelegate file
```swift
let newsfeedVC = NewsfeedVC(collectionViewLayout: UICollectionViewFlowLayout())
```
## Add elements to the cell and fix them using VisualFormat

Add some elements in `class NewsfeedCollectionViewCell: UICollectionViewCell`.

#### NewsfeedCollectionViewCell file
```swift
private lazy var profileImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = #colorLiteral(red: 0.5686792731, green: 0.7940976024, blue: 0.9984217286, alpha: 1)
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "1")
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel! = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Alexey Parkhomenko"
        label.backgroundColor = UIColor.orange
        return label
    }()
```
`Private` because we don't want anyone outside of this class being to access this property
     and the reason for that is later on we are going to only allow anyone who uses this cell to be access
     these properties via the model.
     
`Lazy` in Swift means that it is lazily loaded what means that if we just have like private var or just for profileImageView
     or let profileImageView right variable and we just attack it will be created immediately at the time of the objects
     are the instance initialization. If we have the lazy keyword here these properties would not be created at the time of the initializer. It would be created  first time that property will be called.
     
Then add these elements to the view and fix them using method `func addConstraints(withVisualFormat format: String, views: UIView...)`:

#### NewsfeedCollectionViewCell file
```swift
override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        addSubview(usernameLabel)
        addSubview(profileImageView)
        
        // profileImageView and usernameLabel constraints
        addConstraints(withVisualFormat: "H:|-8-[v0(44)]-8-[v1]-8-|", views: profileImageView, usernameLabel)
        addConstraints(withVisualFormat: "V:|-12-[v0]", views: usernameLabel)
        addConstraints(withVisualFormat: "V:|-12-[v0(44)]", views: profileImageView)
    }
```

Method `func addConstraints(withVisualFormat format: String, views: UIView...)` I made it up for simplicity.

#### Extentions file
```swift
extension UIView {
    
    // set the size for elements in UICollectionViewCell
    // use auto layout constraints in code
    func addConstraints(withVisualFormat format: String, views: UIView...) {
        
        var viewsDictionary = [String:UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
            
        }
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: format,
                                                         options: NSLayoutConstraint.FormatOptions(),
                                                         metrics: nil,
                                                         views: viewsDictionary)
        addConstraints(constraints)
    }
}
```

Result:

![FacebookNewsfeed](https://github.com/ParkhomenkoAlexey/Images/blob/master/FacebookNewsfeed4.png)

### LIFEHACK

If you have to initilize the same elements you may use:

#### NewsfeedCollectionViewCell file
```swift
    private lazy var likeButton: UIButton! = NewsfeedCollectionViewCell.buttonWithTitle("Like", imageName: "icon-like")
    private lazy var commentButton: UIButton! = NewsfeedCollectionViewCell.buttonWithTitle("Comment", imageName: "icon-comment")
    private lazy var shareButton: UIButton! = NewsfeedCollectionViewCell.buttonWithTitle("Share", imageName: "icon-share")
    
    // class keyword here means that this function belongs to the class we can call without initializing an instance
    private class func buttonWithTitle(_ title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(red: 143/255, green: 150/255, blue: 163/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return button
    }
```

## Dymanic change UICollectionViewCell size

Constraints of our cell are arranged vertically as follows:
#### NewsfeedCollectionViewCell file

```swift
// constraints vertical
addConstraints(withVisualFormat: "V:|-8-[v0(44)]-4-[v1][v2]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView, captionTextView, postImageView, postStatLabel, postDividerView, likeButton)
```
Note that some elements have constant values. `[v1][v2]` - captionTextView and postImageView. They both must be present in every post. If something is missing one of these two, the application will break.

Resize height of each cell based on content size
#### NewsfeedVC file 
```swift
// Don't forget to add:
class NewsfeedVC: UICollectionViewController, UICollectionViewDelegateFlowLayout
```

```swift
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let captionText = posts[indexPath.row].caption
        let postImage = posts[indexPath.row].image
        let knownHeight: CGFloat = 8 + 44 + 4 + 8 + 24 + 8 + 0.4 + 44
        
        let textHeight = getCaptionTextHeight(text: captionText!)
        let imageHeight = getPostImageHeight(image: postImage!)
        return CGSize(width: view.frame.width, height: textHeight + knownHeight + imageHeight + 18)
        
    }
```
Please note that we know the size of some elements in advance that we can see in `knownHeight`.

#### NewsfeedVC file
```swift
func getCaptionTextHeight(text: String) -> CGFloat {
        let rect = NSString(string: text).boundingRect(with: CGSize(width: view.frame.width, height: 2000),
                                                       options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin),
                                                       attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)],
                                                       context: nil)
        return rect.height
    }
    
    // dymanic change postImageView size
    func getPostImageHeight(image: UIImage) -> CGFloat {
        let imageCrop = image.getCropRatio()
        let postImageHeigh = view.frame.width / imageCrop
        return postImageHeigh
    }
```

### 1. Caption text height
Font size is set to 14 because in UICollectionViewCell file size of the text is the same. Proof below.

#### NewsfeedCollectionViewCell file
```swift
private lazy var captionTextView: UITextView! = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        return textView
    }()
```
### Post image height
What about the image, we calculate its ratio and derive its height based on the width. Images are real size.

`image.getCropRatio()` my own creation and you can find it in:

#### Extensions file 
```swift
extension UIImage {
    func getCropRatio() -> CGFloat {
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
}
```
P.S. Due to the fact that we dynamically change not only the size of the image, but also the size of the text, there is a small error in calculations, and in cases where a lot of post text is an image for some reason less than it should be. 

What I am talking about: 

![FacebookNewsfeed](https://github.com/ParkhomenkoAlexey/Images/blob/master/FacebookNewsfeed6.png)

I corrected this situation using `contentMode = .scaleAspectFill` instead of `contentMode = .scaleAspectFit`.
#### NewsfeedCollectionViewCell file
```swift
private lazy var postImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true // image do not go outside its bounds
        return imageView
    }()
```

## Author
| [<img src="https://avatars1.githubusercontent.com/u/8983647?s=460&amp;v=4" width="120px;"/>](https://github.com/ParkhomenkoAlexey)   | [Parkhomenko Alexey](https://github.com/ParkhomenkoAlexey)<br/><br/><sub>iOS Software Engineer</sub><br/> [![Facebook][1.1]][1] [![Github][2.1]][2] [![VKontakte][3.1]][3]|
| - | :- |

[1.1]: https://www.kingsfund.org.uk/themes/custom/kingsfund/dist/img/svg/sprite-icon-facebook.svg (facebook icon)
[2.1]: http://i.imgur.com/9I6NRUm.png (github icon without padding)
[3.1]: https://github.com/ParkhomenkoAlexey/Images/blob/master/Orion_vk.svg (vk icon)


[1]: https://www.facebook.com/profile.php?id=100030997816322
[2]: https://github.com/ParkhomenkoAlexey
[3]: https://vk.com/id189198242
