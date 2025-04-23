










<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 首页 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
</head>
<body>

<div id="app">
    <div class="data-detail">
        <div class="data-detail-breadcrumb">
					<span class="layui-breadcrumb">
						<a href="../home/home.jsp">首页</a>
						<a><cite>{{detail.shangpinName}}</cite></a>
					</span>

            <!-- 收藏 -->
            <a onclick="addShangpinCollection()" href="javascript:void(0)">
                <i class="layui-icon" style="font-size: 20px;color: red;">&#xe67a;</i>点我收藏
            </a>

        </div>
        <div class="layui-row">
            <div class="layui-col-md5">
                <div class="layui-carousel" id="swiper">
                    <div carousel-item id="swiper-item">
                        <div v-for="(item,index) in swiperList" v-bind:key="index">
                            <img class="swiper-item" :src="item.img">
                        </div>
                    </div>
                </div>

            </div>
            <div class="layui-col-md7" style="padding-left: 20px;">
                <h1 class="title">{{detail.shangpinName}}</h1>

                <div v-if="detail.shangpinKucunNumber" class="detail-item">
                    <span>商品库存：</span>
                    <span class="desc">
                        {{detail.shangpinKucunNumber}}
                    </span>
                </div>

                <div v-if="detail.shangpinTypes" class="detail-item">
                    <span>商品类型：</span>
                    <span class="desc">
                        {{detail.shangpinValue}}
                    </span>
                </div>

                <div v-if="detail.shangpinPrice" class="detail-item">
                    <span>购买获得积分：</span>
                    <span class="desc">
                        {{detail.shangpinPrice}}
                    </span>
                </div>

                <div v-if="detail.shangpinOldMoney" class="detail-item">
                    <span>商品原价：</span>
                    <span class="desc">
                                {{detail.shangpinOldMoney}}
                    </span>
                </div>

                <div v-if="detail.shangpinNewMoney" class="detail-item">
                    <span>现价/积分：</span>
                    <span class="desc">
                                {{detail.shangpinNewMoney}}
                    </span>
                </div>

                <div v-if="detail.shangpinClicknum" class="detail-item">
                    <span>点击次数：</span>
                    <span class="desc">
                        {{detail.shangpinClicknum}}
                    </span>
                </div>

                <div v-if="detail.temaiTypes" class="detail-item">
                    <span>是否特卖：</span>
                    <span class="desc">
                        {{detail.temaiValue}}
                    </span>
                </div>

                <div class="detail-item">

                    <!--<button onclick="addShangpinqqqqqqqq()" type="button" class="layui-btn layui-btn-warm">
                        添加到购物车
                    </button>-->
                    <div class="num-picker">
                        <button type="button" onclick="reduceBuynumber()"
                                class="layui-btn layui-btn-primary">-
                        </button>
                        <input type="text" id="buyNumber" name="buyNumber" class="layui-input"
                               disabled="disabled" />
                        <button type="button" onclick="plusBuynumber()" class="layui-btn layui-btn-primary">+</button>
                    </div>
                    <button onclick="addShangpinCart()" type="button" class="layui-btn layui-btn-warm">
                        添加到购物车
                    </button>
                    <button onclick="addShangpinOrder()" type="button" class="layui-btn btn-submit">
                        立即购买
                    </button>
                </div>

                <div class="detail-item" style="text-align: right;">
                </div>
            </div>
        </div>

        <div class="layui-row">
            <div class="layui-tab layui-tab-card">

                <ul class="layui-tab-title">

                    <li class="layui-this">详情</li>

                    <li>评价</li>
                </ul>

                <div class="layui-tab-content">

                    <div class="layui-tab-item layui-show">
                        <div v-html="myFilters(detail.shangpinContent)"></div>
                    </div>

                    <div class="layui-tab-item">
                        <div class="message-container">
                            <div class="message-list">
                                <div class="message-item" v-for="(item,index) in shangpinCommentbackDataList" v-bind:key="index">
                                    <div class="username-container">
                                        <img class="avator" :src="item.yonghuPhoto">
                                        <span class="username">用户：{{item.yonghuName}}</span>
                                    </div>
                                    <div class="content">
                                            <span style="color: rgb(175, 135, 77)">
                                                评价:<div v-html="item.shangpinCommentbackContent"></div>
                                            </span>
                                    </div>
                                    <div class="content">
                                            <span style="color: rgb(175, 135, 77)">
                                                回复:<div v-html="item.replyContent"></div>
                                            </span>
                                    </div>
                                </div>
                            </div>
                            <div class="pager" id="shangpinCommentbackPager"></div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../../xznstatic/js/jquery.min.js"></script>
<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 组件配置信息 -->
<script src="../../js/config.js"></script>
<!-- 扩展插件配置信息 -->
<script src="../../modules/config.js"></script>
<!-- 工具方法 -->
<script src="../../js/utils.js"></script>

<script>
    Vue.prototype.myFilters= function (msg) {
        if(msg != null){
            return msg.replace(/\n/g, "<br>");
        }else{
            return "";
        }
    };
    var vue = new Vue({
        el: '#app',
        data: {
            // 轮播图
            swiperList: [],
            // 数据详情
            detail: {
                id: 0
            },
            dataList: [],
            // 加入购物车数量
            buyNumber: 1,
            // 当前详情页表
            detailTable: 'shangpin',
            // 评价列表
            shangpinCommentbackDataList: [],
        },
        //  清除定时器
        destroyed: function () {
            // 不知道具体作用
            // window.clearInterval(this.inter);
        },
        methods: {
            jump(url) {
                jump(url)
            }
        }
    })

    layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery', 'laypage'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;
        var laypage = layui.laypage;

        var limit = 10;

        // 设置数量
        jquery('#buyNumber').val(vue.buyNumber);

        // 数据ID
        var id = http.getParam('id');
        vue.detail.id = id;
        // 当前详情
        http.request(`${vue.detailTable}/detail/` + id, 'get', {}, function (res) {
            // 详情信息
            vue.detail = res.data;
           // 轮播图片
            vue.swiperList = vue.detail.shangpinPhoto ? vue.detail.shangpinPhoto.split(",") : [];
            var swiperItemHtml = '';
            for (let item of vue.swiperList) {
                swiperItemHtml +=
                        '<div>' +
                        '<img class="swiper-item" src="' + item + '">' +
                        '</div>';
            }
            jquery('#swiper-item').html(swiperItemHtml);
            // 轮播图
            carousel.render({
                elem: '#swiper',
                width: swiper.width, height: swiper.height,
                arrow: swiper.arrow,
                anim: swiper.anim,
                interval: swiper.interval,
                indicator: swiper.indicator
            });
        });




        // 获取评价
        http.request(`${vue.detailTable}Commentback/list`, 'get', {
            page: 1,
            limit: limit,
            shangpinId: vue.detail.id
        }, function (res) {
            vue.shangpinCommentbackDataList = res.data.list;
            // 分页
            laypage.render({
                elem: 'shangpinCommentbackPager',
                count: res.data.total,
                limit: limit,
                jump: function (obj, first) {
                    //首次不执行
                    if (!first) {
                        http.request(`${vue.detailTable}Commentback/list`, 'get', {
                            page: obj.curr,
                            limit: obj.limit,
                            shangpinId: vue.detail.id
                        }, function (res) {
                            vue.shangpinCommentbackDataList = res.data.list
                        })
                    }
                }
            });
        });
    });



    // 收藏
    function addShangpinCollection(){
        layui.http.requestJson(`${vue.detailTable}Collection/add`, 'post', {
            yonghuId : localStorage.getItem('userid'),
            shangpinId : vue.detail.id,
            tableName : localStorage.getItem('userTable')
        }, function (res) {
            if(res.code==0){
                layer.msg('收藏成功', {
                    time: 2000,
                    icon: 6
                });
            }else{
                layer.msg(res.msg, {
                    time: 2000,
                    icon: 2
                });
            }
        });
    }

    // 添加数量
    function plusBuynumber() {
        vue.buyNumber++;
        layui.jquery('#buyNumber').val(vue.buyNumber);
    }
    // 减少数量
    function reduceBuynumber() {
        if(vue.buyNumber>1){
            vue.buyNumber--;
        }
        layui.jquery('#buyNumber').val(vue.buyNumber);
    }

    // 添加到购物车
    function addShangpinCart(){
        if (vue.detail.shangpinKucunNumber >= 0 && vue.detail.shangpinKucunNumber < vue.buynumber) {
            layer.msg(`库存不足`, {
                time: 2000,
                icon: 5
            });
            return
        }
        // 查询是否已经添加到购物车
        layui.http.request('cart/list', 'get', {
            yonghuId: localStorage.getItem('userid'),
            shangpinId: vue.detail.id
        }, (res) => {
            if(res.data.list.length > 0){
                layer.msg("该商品信息已经添加到购物车", {
                    time: 2000,
                    icon: 5
                });
                return
            }
            layui.http.requestJson(`cart/add`, 'post', {
                yonghuId : localStorage.getItem('userid'),
                shangpinId : vue.detail.id,
                buyNumber: vue.buyNumber,
            }, function (res) {
                if(res.code==0){
                    layer.msg('添加成功', {
                        time: 2000,
                        icon: 6
                    });
                }else{
                    layer.msg(res.msg, {
                        time: 2000,
                        icon: 2
                    });
                }
            });
        })

        /*layui.http.requestJson(`${vue.detailTable}Cart/add`, 'post', {
            yonghuId : localStorage.getItem('userid'),
            shangpinId : vue.detail.id,
            buyNumber : vue.buyNumber
        }, function (res) {
            if(res.code==0){
                layer.msg('添加购物车成功', {
                    time: 2000,
                    icon: 6
                });
            }else{
                layer.msg(res.msg, {
                    time: 2000,
                    icon: 2
                });
            }
        });*/
    }

    // 立即购买
    function addShangpinOrder(){
        if (vue.detail.shangpinKucunNumber >= 0 && vue.detail.shangpinKucunNumber < vue.buyNumber) {
            layer.msg(`商品信息库存不足`, {
                time: 2000,
                icon: 5
            });
            return
        }
        // 保存到storage中，在确认下单页面中获取要购买的物品
        localStorage.setItem('shangpins', JSON.stringify([{
            shangpinId: vue.detail.id,
            shangpinName: vue.detail.shangpinName,
            shangpinPhoto: vue.detail.shangpinPhoto,
            shangpinKucunNumber: vue.detail.shangpinKucunNumber,
            shangpinTypes: vue.detail.shangpinTypes,
            shangpinPrice: vue.detail.shangpinPrice,
            shangpinOldMoney: vue.detail.shangpinOldMoney,
            shangpinNewMoney: vue.detail.shangpinNewMoney,
            shangpinClicknum: vue.detail.shangpinClicknum,
            temaiTypes: vue.detail.temaiTypes,
            shangxiaTypes: vue.detail.shangxiaTypes,
            shangpinDelete: vue.detail.shangpinDelete,
            shangpinContent: vue.detail.shangpinContent,
            createTime: vue.detail.createTime,
            buyNumber: vue.buyNumber,
            yonghuId: localStorage.getItem('userid'),
        }]));
        // 跳转到确认下单页面
        jump('../shangpinOrder/confirm.jsp');
    }

    // 添加
    /*function addShangpinqqqqqqqq(){
        layui.http.requestJson(`${vue.detailTable}Cart/add`, 'post', {
            yonghuId : localStorage.getItem('userid'),
            shangpinId : vue.detail.id,
            aaaaaaaa : vue.aaaaaaaa
        }, function (res) {
            if(res.code==0){
                layer.msg('添加成功', {
                    time: 2000,
                    icon: 6
                });
            }else{
                layer.msg(res.msg, {
                    time: 2000,
                    icon: 2
                });
            }
        });
    }*/


</script>
</body>
</html>
