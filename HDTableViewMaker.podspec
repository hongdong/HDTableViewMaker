Pod::Spec.new do |s|
  s.name         = "HDTableViewMaker"
  s.version      = "1.0.8"
  s.summary  = '只需一行代码，通过链式风格快速配置UITableView包括创建Delegate和DataSource、添加下拉刷新等各种功能，满足你对UITableView的一切幻想'
  s.homepage     = "https://github.com/hongdong/HDTableViewMaker"
  s.license      = 'MIT'
  s.author       = { "Abner" => "fjhongdong@126.com" }
  s.source       = { :git => 'https://github.com/hongdong/HDTableViewMaker.git',  :tag => "1.0.8"  }
  s.platform     = :ios, "7.0"
  s.source_files = "HDTableViewMaker/*.{h,m}"
  s.resource     = 'HDTableViewMaker/HDTableViewMaker.bundle'
#  s.framework  = 'QuartzCore'
  s.requires_arc = true
  s.dependency 'MJRefresh'
  s.dependency 'UITableView+FDTemplateLayoutCell'
  s.dependency 'Masonry'

end

#pod spec lint --allow-warnings --use-libraries 校验命令
#pod trunk push HDTableViewMaker.podspec --allow-warnings --use-libraries   上传命令