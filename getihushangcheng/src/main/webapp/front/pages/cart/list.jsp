










<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <!--通用-->
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0">
    <title>购物车列表页</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/aos.css" />
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../xznstatic/css/idangerous.swiper.css" />
    <link rel="stylesheet" href="../../xznstatic/css/lightbox.css">
    <link rel="stylesheet" href="../../xznstatic/css/app.css" />
    <link rel="stylesheet" href="../../xznstatic/css/apmin.css"/>
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/color.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/global.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/page.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/uzlist.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/fancybox.css" />
    <script type="text/javascript" src="../../xznstatic/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/superslide.2.1.1.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/wow.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/fancybox.js"></script>
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "../../../resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">
        var CATID = "0",
                BCID = "0",
                NAVCHILDER = "",
                ONCONTEXT = 0,
                ONCOPY = 0,
                ONSELECT = 0;
    </script>
    <style>
        .ng-djn-txt {
            text-align: justify;
            text-justify: inter-ideograph;
            word-wrap: break-word;
            word-break: break-all;
        }
        .ng-inpusbox {
            text-indent:0px;
        }
        .am-inside-adv{
            height:auto;
        }
        .am-inside-adv img {
            width:100%;
        }
        .ng-oa a .small {
            display:none;
        }
        .ng-oa a:hover .small {
            display:block;
        }
        .ng-oa a:hover .image {
            display:none;
        }
        .pos-a {
            height:30px;
            line-height:30px;
            margin:0 5px;
        }
        .pos-a a {
            margin:0 5px;
        }
        .layui-laypage .layui-laypage-curr .layui-laypage-em {
            background-color: var(--publicColor,orange);
        }
        .jishuzichis a {
            font-size: 12px;
            color: #878787;
        }
        .ng-siotext {
            line-height: 50px;
        }

        @media screen and (max-width: 992px) {
            .ng-zein-iten-link li {
                width: 50%;
                text-align: center;
            }
            .ng-zein-iten-link li.li {
                width: 100%;
            }
            .bdshare-button-style2-16 a, .bdshare-button-style2-16 .bds_more {
                float: initial;
            }
            .ng-zein-code {
                width: 100%;
            }
            .ng-zein-code-tit {
                width: 100%;
                text-align: center;
            }
        }

        /* 前台模态框使用集成tinymce富文本框会导致页面做下角出现上传图片和添加表格功能，由于处理不了，把它z-index属性设置为负的，不能让页面上可以点*/
        .tox-pop{
            z-index: -99999;
        }
    </style>
</head>
<body >
<div id="app">
    <!-- 标题 -->
    <h2 class="index-title">SHOP / CART</h2>
    <div class="line-container">
        <p class="line"> 购物车 </p>
    </div>
    <!-- 标题 -->

    <div class="paper-container">
        <table class="layui-table" lay-skin="nob">
            <thead>
            <tr>
                <th>购买商品信息</th>
                <th>现价/积分</th>
                <th>购买数量</th>
                <th>小计</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(item,index) in dataList" v-bind:key="index">
                <td style="display: flex;text-align: left;">
                        <div style="margin-left: 10px;margin-top: 10px;">
                            {{item.shangpinName}}
                        </div>
                        <img :src="item.shangpinPhoto" style="width: 50px;height: 50px;object-fit: cover;">
                </td>
                <td style="width: 200px;">{{item.shangpinNewMoney}} RMB</td>
                <td style="width: 140px;">
                    <div class="num-picker">
                        <button type="button" @click="reduceCartNum(index)" class="layui-btn layui-btn-primary">-</button>
                        <input style="height: 38px;" type="number" :value="item.buyNumber" id="buyNumber" name="buyNumber" class="layui-input"
                               disabled="disabled" />
                        <button type="button" @click="addCartNum(index)" class="layui-btn layui-btn-primary">+</button>
                    </div>
                </td>
                <td style="width: 200px;">{{item.shangpinNewMoney*item.buyNumber}} RMB</td>
                <td style="width: 100px;">
                    <button @click="deleteCart(index)" type="button" class="layui-btn layui-btn-radius btn-theme">
                        <i class="layui-icon">&#xe640;</i> 删除
                    </button>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="btn-container">
            <span style="font-size: 18px;font-weight: bold;color: #ce0b07;margin-right: 20px;">
                总价：{{totalZongjiaMoney}}RMB
            </span>
            <button @click="buyClick" type="button" class="layui-btn layui-btn-lg btn-theme">
                <i class="layui-icon">&#xe657;</i> 点击购买
            </button>
        </div>
    </div></div>


<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<script src="../../js/config.js"></script>
<script src="../../modules/config.js"></script>
<script src="../../js/utils.js"></script>

<script>
    var vue = new Vue({
        el: '#app',
        data: {
            swiperList: [],//轮播图
            dataList: [],//数据
        // 当前表字典表数据
            cartTypes: 0,//类型
            limit: 10,
            projectName: projectName,//项目名
            centerMenu: centerMenu

        },
        updated: function() {
            layui.form.render(null, 'myForm');
        },
        filters: {
            //把字符串去除无用字符 如果字段长度大于60  就截取到60
            subString: function(val) {
                if (val) {
                    val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
                    if (val.length > 60) {
                        val = val.substring(0, 60);
                        val+='...';
                    }

                    return val;
                }
                return '';
            }
        },
        computed: {
            totalZongjiaMoney: function() {
                var total = 0;
                for (var item of this.dataList) {
                    total += item.shangpinNewMoney * item.buyNumber
                }
                return total;
            }
        },
        methods: {
            jump(url) {
                jump(url)
            }
			// 添加数量
			,addCartNum(index) {
				// 查询对应的商品的详情信息，判断是否有商品限次，库存的判断
				var item = this.dataList[index];
				layui.http.request(`shangpin/info/${item.shangpinId}`, 'get', {}, function(res) {
					// 库存限制
					if (res.data.shangpinKucunNumber && res.data.shangpinKucunNumber > 0 && res.data.shangpinKucunNumber <= item.shangpinKucunNumber) {
						layui.layer.msg(`商品信息库存不足`, {
							time: 2000,
							icon: 5
						});
						return
					}
					item.buyNumber = item.buyNumber + 1;
					layui.http.requestJson(`cart/update`, 'post', item, function(res) {});
				});
			},
			// 减少数量
			reduceCartNum(index) {
				var item = this.dataList[index];
				if (item.buyNumber > 1) {
					item.buyNumber = item.buyNumber - 1;
					layui.http.requestJson(`cart/update`, 'post', item, function(res) {});
				}
			},
			// 删除
			deleteCart(index) {
				var item = this.dataList[index];
				layui.http.requestJson(`cart/delete`, 'post', [item.id], function(res) {
					window.location.reload();
				});
			},
			// 购买
			buyClick() {
				localStorage.setItem('shangpins', JSON.stringify(this.dataList));
				window.location.href = '../shangpinOrder/confirm.jsp'
			}
        }
    });

    layui.use(['layer', 'element', 'carousel', 'laypage','form', 'http', 'jquery', 'laydate', 'tinymce'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var form = layui.form;
        var laydate = layui.laydate;
        var tinymce = layui.tinymce;
        window.jQuery = window.$ = jquery = layui.jquery;

        var limit = 10;

        // 获取轮播图 数据
        http.request('config/list', 'get', {
            page: 1,
            limit: 5
        }, function(res) {
            if (res.data.list.length > 0) {
                let swiperList = [];
                res.data.list.forEach(element => {
                    if (element.value != null) {
                        swiperList.push({
                            img: element.value
                        });
                    }
                });
                vue.swiperList = swiperList;
                vue.$nextTick(()=>{
                    var mySwiper = new Swiper('.ng-swiper', {
                        speed: 400,
                        spaceBetween: 100,
                        pagination: '.ng-swiper .swiper-pagination',
                        autoplay : 5000,
                        loop : true,
                        autoplayDisableOnInteraction : false,
                        calculateHeight : true
                    });
                    $(".ng-swiper-ovleft").bind("click",function (){ mySwiper.swipePrev();});
                    $(".ng-swiper-ovright").bind("click",function (){ mySwiper.swipeNext();});
                });
            }
        });
    // 查询当前字典表相关
    // 当前表的字典表




        // 获取列表数据
        http.request('cart/list', 'get', {
            page: 1,
            limit: limit,
            yonghuId: localStorage.getItem('userid')
        }, function(res) {
            vue.dataList = res.data.list
            // 分页
            laypage.render({
                elem: 'pager',
                count: res.data.total,
                limit: limit,
                jump: function(obj, first) {
                    //首次不执行
                    if (!first) {
                        http.request('news/list', 'get', {
                            page: obj.curr,
                            limit: obj.limit,
                            yonghuId: localStorage.getItem('userid')
                        }, function(res) {
                            vue.dataList = res.data.list
                        })
                    }
                }
            });
        })
    });
</script>

<script src="../../xznstatic/js/idangerous.swiper.min.js"></script>
<script src="../../xznstatic/js/aos.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/jquery.superslide.2.1.1.js"></script>
<script src="../../xznstatic/js/app.js"></script>
<script src="../../xznstatic/js/lightbox.js"></script>

<script>
    window.xznResize = function() {
        var mySwiper2 = new Swiper('.ng-inzep',{
            calculateHeight : true,
            loop : true,
            paginationClickable :true,
            pagination: ".ng-inzep .swiper-pagination"
        });

        $(document).bind("scroll",function (){
            if($(".ng-swip-porlist").length > 0){
                if($(window).width() > 769){
                    mySwiper2.params.slidesPerView = 4;
                    mySwiper3.params.slidesPerView = 4;
                }else if($(window).width() < 769){
                    if($(window).width() < 480){
                        mySwiper2.params.slidesPerView = 2;
                        mySwiper3.params.slidesPerView = 2;
                    }else{
                        mySwiper2.params.slidesPerView = 3;
                        mySwiper3.params.slidesPerView = 3;
                    }
                }
            }
        });

        $(window).bind("resize", function () {
            // 强制关闭导航
            if ($(window).width() > 992) { $(".ipad-nav").slideUp(); };

            if ($(".ng-swip-porlist").length > 0) {
                if ($(window).width() > 769) {
                    mySwiper2.params.slidesPerView = 4;
                    mySwiper3.params.slidesPerView = 4;
                } else if ($(window).width() < 769) {
                    if ($(window).width() < 480) {
                        mySwiper2.params.slidesPerView = 2;
                        mySwiper3.params.slidesPerView = 2;
                    } else {
                        mySwiper2.params.slidesPerView = 3;
                        mySwiper3.params.slidesPerView = 3;
                    }
                }
            }

            Spirit_dynamicBG($(".ng-inswbg"), 1600, 616, $(".ng-inswbg"));
            Spirit_CallBack($(".ng-porlist-doc>a"), 280, 200);
            Spirit_CallBack($(".ng-incontlst-img"), 368, 240);
            Spirit_CallBack($(".ng-inzep-ims"), 400, 270);
            Spirit_CallBack($(".ng-isenst-img"), 368, 240);
            Spirit_CallBack($(".ng-prslist-img"), 100, 100);
            Spirit_CallBack($(".ng-vrslist-img"), 260, 170);
            Spirit_CallBack($(".ng-newbve-img-ikk"), 368, 240);

            $(".ng-subc-swiper").css({ "height": $(".ng-subc-swiper").width() });

            if ($(window).width() < 640) {
                $(".am-inside-swf").css({
                    "min-height": $(window).height() - 60
                });
            } else {
                $(".am-inside-swf").css({
                    "min-height": "auto"
                });
            }
        }).resize();
    }
</script>
</body>
</html>
