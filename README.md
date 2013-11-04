HATransparentView
=================

Custom `UIView` subclass based on Rdio stations menu.

![Demo HATransparentView](https://raw.github.com/hebertialmeida/HATransparentView/master/HATransparentViewDemo/Images.xcassets/1.png)

Usage
-----


 1. Import the header file wherever you want to use the HATransparentView:
```objc
#import "HATransparentView.h"
```

 1. Define:
```objc
@property (strong, nonatomic) HATransparentView *transparentView;
```

 1. Open:
```objc
_transparentView = [[HATransparentView alloc] init];
_transparentView.backgroundColor = [UIColor colorWithRed:242/255.0 green:46/255.0 blue:50/255.0 alpha:0.8];
[_transparentView open];
```

 1. Close:
```objc
[_transparentView close];
```


Requirements
----------
* iOS 5.0 or higher
* ARC

## License
HATransparentView is released under the MIT license. See
[LICENSE](https://github.com/hebertialmeida/HATransparentView/blob/master/LICENSE).

Contact me
----------

**Heberti Almeida**  


Contact: [hebertialmeida@gmail.com][1]

Twitter: [http://twitter.com/hebertialmeida][2] 

  [1]: mailto:hebertialmeida@gmail.com
  [2]: http://twitter.com/chroman

