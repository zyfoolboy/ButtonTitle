#设置UIButton的title和image
最近项目中需要做这样一个类似的按钮

![模型图](https://github.com/zyfoolboy/ButtonTitle/blob/master/ButtonTitle/ButtonTitle/Assets.xcassets/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-06-08%20%E4%B8%8B%E5%8D%8810.58.25.imageset/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-06-08%20%E4%B8%8B%E5%8D%8810.58.25.png)

要求为左边文字右边图片，代码如下：
```
UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
btn.frame = CGRectMake(100, 100, 60, 30);
[btn setImage:[UIImage imageNamed:@"item_grid_filter_price_arrow"] forState:UIControlStateNormal];
[btn setTitle:@"选择" forState:UIControlStateNormal];
btn.titleLabel.font = [UIFont systemFontOfSize:12];
[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
btn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
btn.imageEdgeInsets = UIEdgeInsetsMake(5, 45, 5, 0);
[self.view addSubview:btn];
```
出来的效果和预期的不一样：

![模型图](https://github.com/zyfoolboy/ButtonTitle/blob/master/ButtonTitle/ButtonTitle/Assets.xcassets/Simulator%20Screen%20Shot%202016%E5%B9%B46%E6%9C%888%E6%97%A5%20%E4%B8%8B%E5%8D%8811.00.05.imageset/Simulator%20Screen%20Shot%202016%E5%B9%B46%E6%9C%888%E6%97%A5%20%E4%B8%8B%E5%8D%8811.00.05.png)

图片显示正确，title消失了，试了很多办法都没用。<br/>
进入调试模式看一下视图的层级关系图

![模型图](https://github.com/zyfoolboy/ButtonTitle/blob/master/ButtonTitle/ButtonTitle/Assets.xcassets/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-06-08%20%E4%B8%8B%E5%8D%8810.54.08.imageset/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-06-08%20%E4%B8%8B%E5%8D%8810.54.08.png)

此时发现button的titleLabel的高为0，这时找到问题的关键了，但是为什么会造成这种问题呢，在网上找了答案：<br/>
因为图片原来的尺寸太大，在设置UIButton的image的时候会出现误差。这时，需要把图片的尺寸设置为实际显示时的大小，就可以得到想要的效果了

![模型图](https://github.com/zyfoolboy/ButtonTitle/blob/master/ButtonTitle/ButtonTitle/Assets.xcassets/Simulator%20Screen%20Shot%202016%E5%B9%B46%E6%9C%888%E6%97%A5%20%E4%B8%8B%E5%8D%8811.23.53.imageset/Simulator%20Screen%20Shot%202016%E5%B9%B46%E6%9C%888%E6%97%A5%20%E4%B8%8B%E5%8D%8811.23.53.png)

问题虽然解决了，但是还有一些疑问没有弄明白<br/>
1.在显示层级关系图时可以看到buttonLabel的宽为160，为什么是160？<br/>
2.虽然造成这个问题的原因是图片尺寸太大，但是这个图片显示出来的大小是我们期待的效果，并且按钮的imageView的frame也是正常的，按道理说不应该出现按钮的titleLabel的高被挤压为0.

最后，希望知道这些答案的大神能够指点一二。

