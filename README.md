# SearchExampleApp
Shows how to use searchable in SwiftUI to add a search bar on iOS and macOS. Different implementaions showing how to use search suggestions, tokens and search scope 

## How to add a Search bar - Searchable in SwiftUI 
The demo has various implementations for a search bar with the searchable view modifier. These include search suggestions.
A detailed description can be found in this blog post: 
[SwiftUI Search Bar: Best Practices and Examples](https://www.swiftyplace.com/blog/swiftui-search-bar-best-practices-and-examples)

👀 You can watch me implement these search features in this Youtube tutorial: https://youtu.be/e0eO1di0cPY


### Search Text Field with Suggestions on macOS and iOS
You can show search suggestions together with the search text field. On macOS they are shown in a menu below the text field and on iOS they are shown as the main content.
![](/images/search_suggestions_platform.jpg)

You can also show search suggestions depending on the users input. For example, I prepared a default suggestions array and I only show the ones that match with the search term:
![](/images/search_suggestions.jpg)

## Search Tokens and Search Scope
More advanced filtering can be done with search tokens and search scope which are available with iOS 16+ and macOS 13.
A detailed description can be found in these blog posts: 
- [How to use Search Scopes in SwiftUI to improve search on iOS and macOS](https://www.swiftyplace.com/blog/how-to-use-search-scopes-in-swiftui-to-improve-search-on-ios-and-macos)
- [Search Tokens in SwiftUI: How to implement advanced search in iOS and macOS](https://www.swiftyplace.com/blog/search-tokens-swiftui-how-to-implement-advanced-search-in-ios-and-macos)

![](/images/search_tokens.jpg)
