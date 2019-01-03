## 关于GalHub
利用喜+1为没有steam云的游戏同步存档

## 使用
#### 准备工作
* 一款放着不玩且支持steam云同步的游戏(以下代称为宿主游戏)
* 你需要备份存档到云端的游戏(以下代称为寄生游戏)

宿主游戏的云存储空间需大于寄生游戏的存档数据总量(越大越好)，且必须保证二者皆在本地安装(优先选择硬盘占用较小的游戏作为宿主)。  
两款游戏下载安装完成后，确认他们的游戏编号和存档路径。

#### 部署
本步骤在一台全新安装设备上仅需进行一次。  
1. 运行`deployer.bat`脚本
2. 输入宿主/寄生游戏存档路径进行重映射
3. 输入寄生游戏的steamid生成启动脚本
4. 利用bat2exe工具将启动脚本转制为可执行文件并替换宿主游戏的启动程序。

## 创意来源
文章：[Steam喜+1日常-给不支持云的游戏添加云同步](https://zhuanlan.zhihu.com/p/27983563)
