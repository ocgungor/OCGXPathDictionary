# OCGXPathDictionary
A simple XPath like structure to query through NSDictionary in Objective-C. Go to [OCGXPathDictionary-Swift](https://github.com/ocgungor/OCGXPathDictionary-Swift "OCGXPathDictionary-Swift") for the Swift version.

# Problem
Let's say we have an NSDictionary representation of the following json structure.
```
 {
  "Level1" : {
    "Level2" : {
      "Level3" : {
        "Level4" : "I want this"
      }
    }
 }
```

Traditionally, what we would do to get the value of Level4 is:
```
NSDictionary *level1 = dictionary[@"Level1"];
if (level1 && ![level1[@"Level2"] isKindOfClass:[NSNull class]]) {
	NSDictionary *level2 = level1[@"Level2"];
	if (level2 && ![level2[@"Level3"] isKindOfClass:[NSNull class]]) {
		NSDictionary *level3 = level2[@"Level3"];
		if (level3 && ![level3[@"Level4"] isKindOfClass:[NSNull class]]) {
			NSString *level4Value = level3[@"Level4"];
			NSLog(@"%@",level4Value);
		}
	}
}
```
Yet, this is an ugly and annoying piece of code to write. **OCGXPathDictionary** helps you to parse your dictionary with one line of code :) 

# Installation
```
    pod 'OCGXPathDictionary'
```

# Usage

```
NSString *myValue = [dictionary parseDictionaryWithComponents:@"Level1", @"Level2", @"Level3", @"Level4", nil];
```  
*OR*
```
NSString *myValue = [dictionary parseDictionaryWithXPath:@"Level1/Level2/Level3/Level4"];
```
*OR*
```
NSString *myValue = [dictionary parseDictionaryWithObjects:@[@"Level1", @"Level2", @"Level3", @"Level4"]];
```