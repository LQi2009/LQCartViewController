#LZCartViewController
重新整理了之前的购物车逻辑,删除了部分代码,修改了部分方法,逻辑结构更清晰,复用更容易
###购物车功能

- 商品展示
- 商品选择
- 价格计算
- 商品删除


###效果图
![效果图](https://github.com/LQQZYY/CartDemo/blob/master/test.gif)
###说明
本次更新,重新整理了代码,整体结构更清晰,方便在此基础上进行个人需求的定制
- 整体布局脱离了对`Masnary`的依赖
如果需要使用`Masnary`,可重新设置控件坐标
- 重写了自定义`cell`的对外方法
减少了不必要的属性暴漏在.h文件,尽量使用方法来调用相关设置,使用更方面,清晰
```
@interface LZCartTableViewCell : UITableViewCell
//商品数量
@property (assign,nonatomic)NSInteger lzNumber;
@property (assign,nonatomic)BOOL lzSelected;

- (void)LZReloadDataWithModel:(LZCartModel*)model;
- (void)LZNumberAddWithBlock:(LZNumberChangedBlock)block;
- (void)LZNumberCutWithBlock:(LZNumberChangedBlock)block;
- (void)LZCellSelectedWithBlock:(LZCellSelectedBlock)block;
@end
```
对这里的两个属性,需要简单的说明一下:
- lzNumber :主要是提供给外部修改显示的商品数量,商品数量的变动,这次我放在`cell`内;一般情况下,外部需要和服务器交互,只有商品数量真正(服务器内记录的数据)发生变化了,才能去修改显示的数目,在上面的第二个和第三个方法的`block`内修改`cell`的这个属性即可,记得也要修改相应的数据模型;
- lzSelected :主要是提供给外部修改该商品的选中状态,这次我将这个显示状态的变动放在了`cell`外部进行操作,同样是考虑到,外部要和服务器进行交互,只有商品真正(服务器记录的数据)添加到订单内,才能改变显示状态,同样在上面的第四个方法的`block`内修改这个属性即可,同样也要修改相应的数据模型;<br>

**PS:如果这两个量的变化不需要和服务器交互,直接在本地完成的,其显示状态可以直接在`cell`内部相应的点击方法里修改即可,外部只需修改相应的数据模型;**

<br>代码中,我设置了3个`BOOL`值:
```
BOOL _isHiddenNavigationBarWhenDisappear;//记录当页面消失时是否需要隐藏系统导航
BOOL _isHasTabBarController;//是否含有tabbar
BOOL _isHasNavitationController;//是否含有导航
```
作用后面都有注释,其中的第一个`BOOL`值需要简单说明一下:
因为我在控制器的`viewWillAppear`和`viewWillDisappear`方法里做了一些判断,前者判断了当前控制器是否是属于导航,当是属于导航时,需要隐藏系统的导航条,因为有可能不会使用导航,所以我在这里自定义了导航条;后者在退出此视图时,需要把隐藏掉的导航再显示出来,但是这有个前提:使用了系统的导航,没有自定义,鉴于很多情况下都是使用自定义的导航,这时如果显示了系统导航,反而会弄巧成拙,所以第一`BOOL`值就是用来记录是否使用了系统导航的;
```
- (void)viewWillAppear:(BOOL)animated {
    
    if (_isHasNavitationController == YES) {
        if (self.navigationController.navigationBarHidden == YES) {
            _isHiddenNavigationBarWhenDisappear = NO;
        } else {
            self.navigationController.navigationBarHidden = YES;
            _isHiddenNavigationBarWhenDisappear = YES;
        }
    }
  }
```
```
- (void)viewWillDisappear:(BOOL)animated {
    if (_isHiddenNavigationBarWhenDisappear == YES) {
        self.navigationController.navigationBarHidden = NO;
    }
}
```
