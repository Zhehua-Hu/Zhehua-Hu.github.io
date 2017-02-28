---
layout: post
title: 跨平台邮件系统Thunderbird
category: 工具链
tags: 效率工具链
keywords:
description:
---



# profile
##ubuntu
* Run profilemanager
```
thunderbird -profilemanager 
```

**or**

* Modify profiles.ini(Recommanded)
/home/zhehua/.thunderbird/profiles.ini
"IsRelative" means relative
```
[General]
StartWithLastProfile=1

[Profile0]
Name=default
IsRelative=1
Path=ismxhitq.default

[Profile1]
Name=thunderbird_20160819
IsRelative=0
Path=/home/zhehua/CrossSync/SoftwareConfig/Email
Default=1
```


##windows
C:\Users\YOURNAME\AppData\Roaming\Thunderbird\profiles.ini
add below codes
```
[Profile1]
Name=thunderbird_20160819
IsRelative=0
Path=H:\Clouds\CrossSync\SoftwareConfig\Email
Default=1
```

# Add-on
Thunderbird Conversations
按邮件话题集中显示相关邮件

Download Status Bar


# FAQ
When I send a message using Thunderbird, it hangs on "Copying message to Sent folder"?
* Tools –> Account Settings
* Select 'Copies and Folders' under your Citadel account.
* Look for the box that says 'When sending messages, automatically…' and observe that there is a checkbox below it labelled 'Place a copy in…'
* Uncheck that box, click OK, and resume your happy day.


# Sources
[Profile Setting](http://kb.mozillazine.org/Moving_your_profile_folder_-_Thunderbird)


# My config
BUAA
IMAP mail.buaa.edu.cn 993 SSL NORMAL PASSWORD
SMTP mail.buaa.edu.cn 465 SSL NORMAL PASSWORD



