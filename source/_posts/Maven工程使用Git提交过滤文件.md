------

title: Maven工程使用Git提交过滤文件

date: 2018-5-26 10:23:18

toc: true

tag: 

- Maven
- Git

------



>  Maven创建的工程，使用Git进行提交时，只需要提交最重要的文件，编译文件等文件不需要提交

# 在仓库中创建.gitignore文件
![](http://i.imgur.com/m69P0ZW.png)

# 编辑.gitignore文件
    `
    ##ignore this file##
    /target/
    
    .classpath
    .project
    .settings     
     ##filter databfile、sln file##
    *.mdb  
    *.ldb  
    *.sln   
    ##class file##
    *.com  
    *.class  
    *.dll  
    *.exe  
    *.o  
    *.so 
    # compression file
    *.7z  
    *.dmg  
    *.gz  
    *.iso  
    *.jar  
    *.rar  
    *.tar  
    *.zip  
    *.via
    *.tmp
    *.err
    # OS generated files #  
    .DS_Store  
    .DS_Store?  
    ._*  
    .Spotlight-V100  
    .Trashes  
    Icon?  
    ehthumbs.db  
    Thumbs.db  

`

# 最终提交时文件
![](http://i.imgur.com/FDKZhFH.png)