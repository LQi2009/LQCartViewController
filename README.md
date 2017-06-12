# LZCartViewController
重新整理了之前的购物车逻辑,删除了部分代码,修改了部分方法,逻辑结构更清晰,复用更容易
#####此demo的swift版本:[CartDemo_Swift](https://github.com/LQQZYY/CartDemo_Swift)

# 本demo完整展示了购物车的处理逻辑, 及实现思路, 具体的业务处理, 还需要根据自己的需求来定制
### 购物车功能

- 商品展示
- 商品选择
- 价格计算
- 商品删除

### 说明
本次更新,重新整理了代码,整体结构更清晰,方便在此基础上进行个人需求的定制
- 整体布局脱离了对`Masnary`的依赖
如果需要使用`Masnary`,可重新设置控件坐标
- 重写了自定义`cell`的对外方法
减少了不必要的属性暴漏在.h文件,尽量使用方法来调用相关设置,使用更方便,逻辑更清晰

```Objective-C
@interface LZCartTableViewCell : UITableViewCell
//商品数量
@property (assign,nonatomic)NSInteger lzNumber;
@property (assign,nonatomic)BOOL lzSelected;

- (void)reloadDataWithModel:(LZCartModel*)model;
- (void)numberAddWithBlock:(LZNumberChangedBlock)block;
- (void)numberCutWithBlock:(LZNumberChangedBlock)block;
- (void)cellSelectedWithBlock:(LZCellSelectedBlock)block;
@end
```

对这里的两个属性,需要简单的说明一下:
- lzNumber :主要是提供给外部修改显示的商品数量,商品数量的变动,这次我放在`cell`内;一般情况下,外部需要和服务器交互,只有商品数量真正(服务器内记录的数据)发生变化了,才能去修改显示的数目,在上面的第二个和第三个方法的`block`内修改`cell`的这个属性即可,记得也要修改相应的数据模型;
- lzSelected :主要是提供给外部修改该商品的选中状态,这次我将这个显示状态的变动放在了`cell`外部进行操作,同样是考虑到,外部要和服务器进行交互,只有商品真正(服务器记录的数据)添加到订单内,才能改变显示状态,同样在上面的第四个方法的`block`内修改这个属性即可,同样也要修改相应的数据模型;<br>

**PS:如果这两个量的变化不需要和服务器交互,直接在本地完成的,其显示状态可以直接在`cell`内部相应的点击方法里修改即可,外部只需修改相应的数据模型;**

<br>代码中,我设置了3个`BOOL`值:
```Objective-C
BOOL _isHiddenNavigationBarWhenDisappear;//记录当页面消失时是否需要隐藏系统导航
BOOL _isHasTabBarController;//是否含有tabbar
BOOL _isHasNavitationController;//是否含有导航
```
作用后面都有注释,其中的第一个`BOOL`值需要简单说明一下:
因为我在控制器的`viewWillAppear`和`viewWillDisappear`方法里做了一些判断,前者判断了当前控制器是否是属于导航,当是属于导航时,需要隐藏系统的导航条,因为有可能不会使用导航,所以我在这里自定义了导航条;后者在退出此视图时,需要把隐藏掉的导航再显示出来,但是这有个前提:使用了系统的导航,没有自定义,鉴于很多情况下都是使用自定义的导航,这时如果显示了系统导航,反而会弄巧成拙,所以第一`BOOL`值就是用来记录是否使用了系统导航的;
```Objective-C
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
```Objective-C
- (void)viewWillDisappear:(BOOL)animated {
    if (_isHiddenNavigationBarWhenDisappear == YES) {
        self.navigationController.navigationBarHidden = NO;
    }
}
```
##### 价格计算
价格的计算,这里我是直接遍历已选择的数组,取出其中的`Model`来计算的:
```Objective-C
/**
 *  @author LQQ, 16-02-18 11:02:16
 *
 *  计算已选中商品金额
 */
-(void)countPrice {
    double totlePrice = 0.0;
    
    for (LZCartModel *model in self.selectedArray) {
        
        double price = [model.price doubleValue];
        
        totlePrice += price*model.number;
    }
    self.totlePriceLabel.text = [NSString stringWithFormat:@"￥%.2f",totlePrice];
}
```
### 使用
使用的时候直接将`demo`中的`LZCartViewController`文件夹下的文件拖进工程即可,注意不能直接使用,要根据自己的需求修改;
##### 关于控制器`LZCartViewController`
建议直接使用我这个控制器`LZCartViewController`,里面我根据功能划分了几个区域,界面的东西修改为自己需要的,逻辑部分可以不用做太大的修改,添加上与服务器的交互及验证逻辑即可;
##### 关于数据模型`LZCartModel`
数据模型这里肯定是要根据自己的需求进行定制的,这里我创建的模型是这样的:

```Objective-C
@interface LZCartModel : NSObject
//自定义模型时,这三个属性必须有
@property (nonatomic,assign) BOOL select;
@property (nonatomic,assign) NSInteger number;
@property (nonatomic,copy) NSString *price;
//下面的属性可根据自己的需求修改
@property (nonatomic,copy) NSString *sizeStr;
@property (nonatomic,copy) NSString *nameStr;
@property (nonatomic,copy) NSString *dateStr;
@property (nonatomic,retain)UIImage *image;

@end
```
需要注意的是,demo中的模型前三个属性,是必须要有的,一般购物车也都有这些属性,如果不想改动太多,建议使用和我一样的命名
- select:用来记录当前数据是否被选中;
- number和price:用来计算总价;

##### 关于自定义单元格`LZCartTableViewCell`
建议直接修改界面布局为自己项目的设计,里面大部分的逻辑是不需要动的,除非你把网络请求的一些东西放到`cell`中来了;
.h文件内的属性和方法,建议不要修改,可以直接使用;
##### 关于`ConfigFile`文件夹
里面有三个文件,一个是`UIView`的扩展类目;一个是头文件,保存一些公共的宏定义和全局变量;
### 效果图
![效果图](https://github.com/LQQZYY/CartDemo/blob/master/test.gif)
![增加分组效果图](https://github.com/LQQZYY/CartDemo/blob/master/testttt.gif)
### 总结
购物车的逻辑其实并不复杂,重构这个`demo`也花了不少时间,希望对你能有所帮助,使用过程中如果有bug,或者功能上错误,或者一些新功能,或者其他的建议,请可以联系我302934443;
#### 如果对你有帮助,欢迎右上角`star`或者`fork`
##### 本人[CSDN博客](http://blog.csdn.net/lqq200912408),欢迎访问,一同学习!!!!
##### [简书地址](http://www.jianshu.com/users/2846c3d3a974/latest_articles),目前文章还不多,慢慢的会发一些学习总结,欢迎关注!
