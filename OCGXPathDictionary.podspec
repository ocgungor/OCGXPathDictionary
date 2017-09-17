Pod::Spec.new do |s|

  s.name         = "OCGXPathDictionary"
  s.version      = "0.0.1"
  s.summary      = "A simple XPath like structure to query through NSDictionary"
  s.description  = "A simple XPath like structure to quert through NSDictionary in Objective-C."
  s.homepage     = "https://github.com/ocgungor/OCGXPathDictionary"
  s.license      = { :type => "Apache", :file => "LICENSE" }
  s.author       = "Oguzhan Gungor"
  s.source       = { :git => "https://github.com/ocgungor/OCGXPathDictionary.git",
                     :tag => "#{s.version}"
                    }
  s.source_files  = "Classes", "OCGXPathDictionary/Classes/**/*.{h,m}"
  s.requires_arc = true
end