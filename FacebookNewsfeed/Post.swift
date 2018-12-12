
import UIKit

// 26
struct Post
{
    var createdBy: User
    var timeAgo: String?
    var caption: String?
    var image: UIImage?
    var numberOfLikes: Int?
    var numberOfComments: Int?
    var numberOfShares: Int?
    
    
    static func fetchPosts() -> [Post]
    {
        var posts = [Post]()
        
        let Steve = User(username: "Steve Jobs", profileImage: UIImage(named: "Steve"))
        let post1 = Post(createdBy: Steve, timeAgo: "1 hr", caption: "Don’t take it all too seriously. If you want to live your life in a creative way, as an artist, you have to not look back too much. You have to be willing to take whatever you’ve done and whoever you were and throw them away.", image: UIImage(named: "1"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 28)
        
        let Albert = User(username: "Albert Einstein", profileImage: UIImage(named: "Albert"))
        let post2 = Post(createdBy: Albert, timeAgo: "3 hrs", caption: "Learn from yesterday, live for today, hope for tomorrow. The important thing is not to stop questioning.", image: UIImage(named: "2"), numberOfLikes: 8, numberOfComments: 12, numberOfShares: 92)
        
        let Denzel = User(username: "Denzel Washington", profileImage: UIImage(named: "Denzel"))
        let post3 = Post(createdBy: Denzel, timeAgo: "5 hrs", caption: "Success? I don't know what that word means. I'm happy. But success, that goes back to what in somebody's eyes success means. For me, success is inner peace. That's a good day for me.", image: UIImage(named: "3"), numberOfLikes: 8, numberOfComments: 92, numberOfShares: 89)
        
        
        let Jeff = User(username: "Jeff Bezos", profileImage: UIImage(named: "Jeff"))
        let post4 = Post(createdBy: Jeff, timeAgo: "2 hrs", caption: "If you're not stubborn, you'll give up on experiments too soon. And if you're not flexible, you'll pound your head against the wall and you won't see a different solution to a problem you're trying to solve.", image: UIImage(named: "4"), numberOfLikes: 94, numberOfComments: 8, numberOfShares: 918)
        
        let Mary = User(username: "Mary Kay Ash", profileImage: UIImage(named: "Mary"))
        let post5 = Post(createdBy: Mary, timeAgo: "8 hrs", caption: "Don't limit yourself. Many people limit themselves to what they think they can do. You can go as far as your mind lets you. What you believe, remember, you can achieve.", image: UIImage(named: "5"), numberOfLikes: 99, numberOfComments: 83, numberOfShares: 89)
        
        let Mark = User(username: "Mark Zuckerberg", profileImage: UIImage(named: "Mark"))
        let post6 = Post(createdBy: Mark, timeAgo: "Yesterday", caption: "The biggest risk is not taking any risk... In a world that's changing really quickly, the only strategy that is guaranteed to fail is not taking risks.", image: UIImage(named: "6"), numberOfLikes: 9, numberOfComments: 82, numberOfShares: 74)
        
        posts.append(post1)
        posts.append(post4)
        posts.append(post2)
        posts.append(post5)
        posts.append(post3)
        posts.append(post6)
        
        return posts
    }
}

struct User
{
    var username: String?
    var profileImage: UIImage?
}













