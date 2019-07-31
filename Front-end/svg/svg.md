### SVG基础
-  standalone 属性 规定此 SVG 文件是否是“独立的”，或含有对外部文件的引用。
-  DTD 文件 含有所有允许的 SVG 元素
-  SVG文件插入html文档的三种方法
	1. `<embed>`
		`<embed src="rect.svg" width="300" height="100" type="image/svg+xml" pluginspage="http://www.adobe.com/svg/viewer/install/" />`
	2. `<object>`
		`<object data="rect.svg" width="300" height="100" type="image/svg+xml" codebase="http://www.adobe.com/svg/viewer/install/" />`
	3. `<iframe>`
		`<iframe src="rect.svg" width="300" height="100"> </iframe>`

### SVG形状
- `<rect>` 矩形
  + CSS 的 fill 属性定义矩形的填充颜色，stroke 属性定义矩形边框的颜色，stroke-width
  + CSS属性  fill-opacity  stroke-opacity
  + rx 和 ry 属性可使矩形产生圆角。
- `<circle>` cx 和 cy 属性定义圆点坐标，r属性圆半径
- `<ellipse>` 椭圆
  + cx 和 cy 属性定义椭圆点坐标，rx属性水平半径，ry垂直半径
- `<line>` x1,y1是线条开始点，x2，y2是线条结束点
- `<polygon>` 创建含有不少于三个边的多边图形
  + points 属性定义多边形每个角的 x 和 y 坐标
- `<polyline>` 折线（直线）
- `<path>` 标签  

		M = moveto(M X,Y) ：将画笔移动到指定的坐标位置
		L = lineto(L X,Y) ：画直线到指定的坐标位置
		H = horizontal lineto(H X)：画水平线到指定的X坐标位置
		V = vertical lineto(V Y)：画垂直线到指定的Y坐标位置
		C = curveto(C X1,Y1,X2,Y2,ENDX,ENDY)：三次贝赛曲线
		S = smooth curveto(S X2,Y2,ENDX,ENDY)
		Q = quadratic Belzier curve(Q X,Y,ENDX,ENDY)：二次贝赛曲线
		T = smooth quadratic Belzier curveto(T ENDX,ENDY)：映射
		A = elliptical Arc(A RX,RY,XROTATION,FLAG1,FLAG2,X,Y)：弧线
		Z = closepath()：关闭路径
  + A指令
  
		   	RX,RY指所在椭圆的半轴大小 
		   	XROTATION指椭圆的X轴与水平方向顺时针方向夹角，可以想像成一个水平的椭圆绕中心点顺时针旋转XROTATION的角度。
			FLAG1只有两个值，1表示大角度弧线，0为小角度弧线。
			FLAG2只有两个值，确定从起点至终点的方向，1为顺时针，0为逆时针
			X,Y为终点坐标

### SVG滤镜
- SVG元素上可用的滤镜有：

		feBlend
		feColorMatrix
		feComponentTransfer
		feComposite
		feConvolveMatrix
		feDiffuseLighting
		feDisplacementMap
		feFlood
		feGaussianBlur
		feImage
		feMerge
		feMorphology
		feOffset
		feSpecularLighting
		feTile
		feTurbulence
		feDistantLight
		fePointLight
		feSpotLight
- 高斯滤镜	feGaussianBlur

		<?xml version="1.0" standalone="no"?>
		<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" 
		"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
		
		<svg width="100%" height="100%" version="1.1"
		xmlns="http://www.w3.org/2000/svg">
		
		<defs>
		<filter id="Gaussian_Blur">
		<feGaussianBlur in="SourceGraphic" stdDeviation="3" />
		</filter>
		</defs>
		
		<ellipse cx="200" cy="150" rx="70" ry="40"
		style="fill:#ff0000;stroke:#000000;
		stroke-width:2;filter:url(#Gaussian_Blur)"/>
		
		</svg>
	+ 滤镜效果是通过 <feGaussianBlur> 标签进行定义的。
	+ <feGaussianBlur> 标签的 stdDeviation 属性可定义模糊的程度
	+ in="SourceGraphic" 这个部分定义了由整个图像创建效果
### svg渐变：	从一种颜色到另一种颜色的平滑过渡
  - `<linearGradient>`  线性渐变
  - `<radialGradient> ` 放射性渐变