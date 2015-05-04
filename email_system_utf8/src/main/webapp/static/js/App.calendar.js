/*
 * Version:  v1.4
 * Website:  http://www.19lou.com
 * Author:   gaoli
 * Recently: ghy (2010-12-12)
 */
//浏览器判断=====
var userAgent = navigator.userAgent.toLowerCase(),is_ie = (userAgent.indexOf('msie') != -1 && !/opera/.test(userAgent)) && userAgent.substr(userAgent.indexOf('msie') + 5, 3),is_ie6=!+'\v1' && !('maxHeight' in document.body.style);
//阻止元素原来的事件============
function doane(event) {
    e = event ? event : window.event;
    if (is_ie) {
        e.returnValue = false;
        e.cancelBubble = true;
    } else if (e) {
        e.stopPropagation();
        e.preventDefault();
    }
}
;
function showcalendar(event, addtime1, parentid1, startdate1, enddate1, fn) {
    //====================函数执行区===============================
    //初始化加载-执行------------------------------------
    var st = window.dk_calendar,st_fn = null,event = event ? event : window.event,target = event.target || event.srcElement;
    //处理传入的参数===========================
    if (typeof(arguments[arguments.length - 1]) == "function" && arguments.length > 1) {
        st_fn = arguments[arguments.length - 1];
        arguments[arguments.length - 1] = null;
    }
    //属性=======
    if (st == null) {
        st = window.dk_calendar = this.setting = {
            state:false,event:null,controlid:null,currdate:null,startdate:false,enddate:false,currday:null,yy:null,mm:null,hh:null,ii:null,addtime:false,today:new Date(),lastcheckedyear:false,lastcheckedmonth:false,calendar_parent:null,calendar:null,dk_confimbox:null,hourminute:null,calendar_year:null,calendar_month:null,calendariframe:null,calendariframe_year:null,calendariframe_month:null,is_ie:is_ie,p:null,s_width:null,
            refreshcalendar:function (y, m) {//刷新日历===========
                var x = new Date(y, m, 1);
                var mv = x.getDay();
                var d = x.getDate();
                var dd = null;
                yy = x.getFullYear();
                mm = x.getMonth();
                this.$i("year").innerHTML = yy;
                this.$i("month").innerHTML = mm + 1 > 9 ? (mm + 1) : '0' + (mm + 1);
                for (var i = 1; i <= mv; i++) {
                    dd = this.$i("d" + i);
                    dd.innerHTML = "&nbsp;";
                    dd.className = "";
                }
                ;
                var dayTime = 24 * 60 * 60 * 1000;
                while (x.getMonth() == mm) {
                    dd = this.$i("d" + (d + mv));
                    dd.innerHTML = '<a href="###" onclick="dk_calendar.settime(' + d + ');return false">' + d + '</a>';
                    if (this.startdate && this.enddate) {
                        (x.getTime() + dayTime < this.startdate.getTime() || x.getTime() > this.enddate.getTime()) ? dd.className = 'expire' : dd.className = 'default';
                    } else if (this.startdate) {
                        (x.getTime() + dayTime < this.startdate.getTime()) ? dd.className = 'expire' : dd.className = 'default';
                    } else if (this.enddate) {
                        (x.getTime() > this.enddate.getTime()) ? dd.className = 'expire' : dd.className = 'default';
                    } else {
                        dd.className = 'default';
                    }

                    //判断是否为expire
                    if (dd.className === "expire") {
                        dd.innerHTML = '<a href="javascript:;">' + d + '</a>';
                    }
                    //判断是否今天/选中
                    if (x.getFullYear() == this.today.getFullYear() && x.getMonth() == this.today.getMonth() && x.getDate() == this.today.getDate()) {
                        if (!st.isHideToday)dd.className = 'today';
                        dd.firstChild.title = '今天';
                    }
                    if (x.getFullYear() == this.currday.getFullYear() && x.getMonth() == this.currday.getMonth() && x.getDate() == this.currday.getDate()) {
                        dd.className = 'checked';
                    }
                    x.setDate(++d);
                }
                while (d + mv <= 42) {
                    dd = this.$i("d" + (d + mv));
                    dd.innerHTML = "&nbsp;";
                    d++;
                }
                if (this.addtime) {
                    this.$i('hour').value = this.zerofill(this.hh);
                    this.$i('minute').value = this.zerofill(this.ii);
                }
            },
            settime:function (d) {//时间================
                this.calendar.style.display = 'none';
                this.calendar_month.style.display = 'none';
                this.calendar_year.style.display = 'none';

                //关闭today标识
                this.isHideToday = true;

                var checkData = (this.addtime ? ' ' + this.zerofill(this.$i('hour').value) + ':' + this.zerofill(this.$i('minute').value) : '');
                if (d) {
                    checkData = yy + "-" + this.zerofill(mm + 1) + "-" + this.zerofill(d) + checkData;
                } else {
                    var today = parsedate("today");
                    checkData = this.zerofill(today.getFullYear()) + "-" + this.zerofill(today.getMonth() + 1) + "-" + this.zerofill(this.today.getDate()) + checkData;
                }

                if(this.fn!=null&&this.fn.call(this,checkData)){
                    this.controlid.value=checkData;
                    return
                };
                try {
                    this.controlid.value = checkData;
                } catch(e) {
                    return;
                }
            },
            showdiv:function(id) {
                var p = this.getposition(this.$i(id));
                this.$i('calendar_' + id).setCss({left:p['x'] + 'px',top:(p['y'] + 16) + 'px'})
                if (this.$i('calendar_' + id).style.display == "none") {
                    this.$i('calendar_' + id).setCss({display:'block'})
                }else {
                    this.$i('calendar_' + id).setCss({display:'none'})
                }
            },
            //工具====================
            $i:function $i(id) {//对象=========
                var a = document.getElementById(id);
                if (a != null && !a.setCss) {
                    a.setCss = function(c) {
                        for (var aa in c) {
                            this.style[aa] = c[aa]
                        }
                    };
                }
                return a;
            },
            $c:function(t, arg) {//创建元素======
                var e = document.createElement(t);
                for (var i in arg) {
                    e.setAttribute(i, arg[i]);
                }
                return e;
            },
            getposition:function(obj) {//坐标====================
                var id = obj.getAttribute("id"),pid = st.parentid;
                if (id == "year" || id == "month")pid = "calendar-box";
                var r = new Array();
                r['x'] = obj.offsetLeft;
                r['y'] = obj.offsetTop;
                var y = r['y'];
                if (st.parentid) {
                    //ie6
                    if(!is_ie6)
                        r['y'] = obj.offsetTop + document.documentElement.scrollTop || document.body.scrollTop || 0;
                    while (obj = obj.offsetParent) {
                        if (obj.style.position != "absolute" && obj.getAttribute("id") != pid) {
                            if(id == "year" || id == "month"){
                                r['y'] = y;
                            }
                            r['x'] += obj.offsetLeft;
                            var top = obj.scrollTop || 0;
                            r['y'] = r['y'] + top + obj.offsetTop;
                            //console.log(obj.offsetTop + "--===y-" + r['y']);
                            //console.log(obj.offsetLeft + "--===x-" + r['x']);
                            //console.log("id:" + st.parentid)
                            if(id == "year" || id == "month")break;
                        }
                    }

					// fix chrome parent
					if(obj !== document.body &&!(id == "year" || id == "month")){
						r['y'] = r['y'] + document.body.scrollTop;
					}

                } else {
//                    r['y'] = obj.offsetTop + document.documentElement.scrollTop || document.body.scrollTop || 0;
                    while (obj = obj.offsetParent) {
                        if (obj.style.position != "absolute" && obj.id != "calendar-box") {
                            r['x'] += obj.offsetLeft;
                            //                            r['y'] += obj.offsetTop;
                            //                            var top=obj.scrollTop||0
                            r['y'] = r['y'] + obj.offsetTop;
                        }
                    }
					//r['y'] = r['y'] + document.body.scrollTop;
                }

                return r;
            },
            getScroll:function() {//滚动条================
                var t, l, w, h;
                if (document.documentElement && document.documentElement.scrollTop) {
                    t = document.documentElement.scrollTop;
                    l = document.documentElement.scrollLeft;
                    w = document.documentElement.scrollWidth;
                    h = document.documentElement.scrollHeight;
                } else if (document.body) {
                    t = document.body.scrollTop;
                    l = document.body.scrollLeft;
                    w = document.body.scrollWidth;
                    h = document.body.scrollHeight;
                }
                return { t: t, l: l, w: w, h: h };
            },
            zerofill:function(s) {//数字格式化=============
                var s = parseFloat(s.toString().replace(/(^[\s0]+)|(\s+$)/g, ''));
                s = isNaN(s) ? 0 : s;
                return (s < 10 ? '0' : '') + s.toString();
            },
            isParent:function(obj, pobj)/*判断是否子对象*/ {
                while (obj != undefined && obj != null && obj.tagName.toUpperCase() != 'BODY') {
                    if (obj == pobj)
                        return true;
                    obj = obj.parentNode;
                }
                return false;
            },


            todayDate:function() {//设置为今天
                this.settime(0);
            },

            clearDate:function() {    //清除日期数据===
                this.calendar.style.display = 'none';
                this.controlid.value = "";
            }

        };
        //日历制作============================
        if (st.calendar_parent == null) {
            var startdate = startdate1 ? parsedate(startdate1) : false,
                    enddate = enddate1 ? parsedate(enddate1) : false,
                    parentid = parentid1 || null;
            //设置参数============================
            var currday = target.value ? parsedate(target.value) : st.today;
            resetArg(st, {event:event,controlid:target,addtime:addtime1,parentid:parentid,startdate:startdate,enddate:enddate,p:st.getposition(target),s_width:st.getScroll().w - 210,currday:currday,hh:currday.getHours(),ii:currday.getMinutes(),fn:st_fn});
            loadcalendar();
            fixCal();
            st.isOnClick = "init";
        }
    }
    //------------------------------------
    setDefalut();
    doane(event);
    st.calendar.style.display = 'block';
    st.isOnClick === "init" || !st.isOnClick ? st.isOnClick = false : st.isOnClick = true;
    //方法========================
    //默认值的显示=====================
    function setDefalut() {
        //判断是否是同一个元素===========
        if (target != st.controlid || st.parentid != null) {
            var startdate = startdate1 ? parsedate(startdate1) : false,
                    enddate = enddate1 ? parsedate(enddate1) : false,
                    parentid = parentid1 || null;
            resetArg(st, {event:event,controlid:target,addtime:addtime1,parentid:parentid,startdate:startdate,enddate:enddate,p:st.getposition(target),fn:st_fn});
            //填补=============
            if (st.$i("calendar_parent") == null)loadcalendar();
            //重新定位==========
            fixCal();
            //窗口定位
            if (st.$i(st.parentid) != null) {
                st.$i(st.parentid).appendChild(st.$i("calendar_parent"));

                var $win        = $(window),
                    winTop      = $win.scrollTop(),
                    $calendar   = $("#calendar-box"),
                    calendarTop = parseInt($calendar.css("top"));

                $calendar.css("top", calendarTop - winTop);
            }

        }
        //获取文本时间==========
        var currday = target.value ? parsedate(target.value) : st.today;
        resetArg(st, {currday:currday,hh:currday.getHours(),ii:currday.getMinutes()});

        st.refreshcalendar(st.currday.getFullYear(), st.currday.getMonth());
        if (st.lastcheckedyear != false) {
            st.$i('calendar_year_' + st.lastcheckedyear).className = 'default';
            st.$i('calendar_year_' + st.today.getFullYear()).className = 'today';
        }
        if (st.lastcheckedmonth != false) {
            st.$i('calendar_month_' + st.lastcheckedmonth).className = 'default';
            st.$i('calendar_month_' + (st.today.getMonth() + 1)).className = 'today';
        }
        st.$i('calendar_year_' + st.currday.getFullYear()).className = 'checked';
        st.$i('calendar_month_' + (st.currday.getMonth() + 1)).className = 'checked';
        st.$i('hourminute').style.display = st.addtime ? '' : 'none';
        st.lastcheckedyear = st.currday.getFullYear();
        st.lastcheckedmonth = st.currday.getMonth() + 1;
    }

    //位置计算===================
    function fixCal() {
        if (Math.abs(st.s_width - st.p['x']) < 80) {
            st.calendar.style.left = document.body.clientWidth - 220 + "px"
        } else {
            st.calendar.style.left = st.p['x'] + 'px';
        }
        ;
        var h = st.controlid.clientHeight;
        h ? h += 5 : h = 20;
        if (st.dk_confimbox == null) {
            st.calendar.style.top = (st.p['y'] + h) + 'px';
        } else {
            var stop = getScroll().t;
            st.calendar.style.top = (st.p['y'] + h - stop) + 'px';
        }
    }

    //刷新属性=============
    function resetArg(s, obj) {
        for (var i in obj) {
            s[i] = obj[i];
        }
    }

    //初始化函数==========================
    function loadcalendar() {

        var s = '';
        s += '<div style="width:210px;"><table class="tableborder" cellspacing="0" cellpadding="0" width="210" style="text-align: center;">';
        s += '<tr><td class="header"><a href="###" class="calendar-prevmonth" onclick="dk_calendar.refreshcalendar(yy, mm-1)" title="上一月">《</a></td><td colspan="5" class="header"><a href="###" onclick="dk_calendar.showdiv(\'year\');doane(event)" class="dropmenu" title="点击选择年份" id="year"></a>&nbsp; - &nbsp;<a id="month" class="dropmenu" title="点击选择月份" href="###" onclick="dk_calendar.showdiv(\'month\');doane(event)"></a></td><td class="header"><A href="###" class="calendar-nextmonth" onclick="dk_calendar.refreshcalendar(yy, mm+1)" title="下一月">》</A></td></tr>';
        s += '<tr id="category"><td>日</td><td>一</td><td>二</td><td>三</td><td>四</td><td>五</td><td>六</td></tr>';
        for (var i = 0; i < 6; i++) {
            s += '<tr class="altbg2">';
            for (var j = 1; j <= 7; j++)
                s += "<td id=d" + (i * 7 + j) + ">0</td>";
            s += "</tr>";
        }
        s += '<tr><td colspan="7" align="center"><div  class="foot-cal"><span id="hourminute" class="hourminute"><input type="text" size="2" value="" id="hour" onKeyUp=\'this.value=this.value > 23 ? 23 : dk_calendar.zerofill(this.value);dk_calendar.controlid.value=dk_calendar.controlid.value.replace(/\\d+(\:\\d+)/ig, this.value+"$1")\'>时 <input type="text" size="2" value="" id="minute" onKeyUp=\'this.value=this.value > 59 ? 59 : dk_calendar.zerofill(this.value);dk_calendar.controlid.value=dk_calendar.controlid.value.replace(/(\\d+\:)\\d+/ig, "$1"+this.value)\'>分</span><a href="###" onclick="dk_calendar.todayDate();">今天</a>&nbsp;<a href="###" onclick="dk_calendar.clearDate();">清空</a></div></td></tr>';
        s += '</table></div>';
        s += '</div>';
        s += '<div id="calendar_year" class="calendar-select" onclick="doane(event)" style="display: none">';
        for (var k = 1930; k <= 2019; k++) {
            s += '<a href="###" onclick="dk_calendar.refreshcalendar(' + k + ', mm);dk_calendar.$i(\'calendar_year\').style.display=\'none\'"><span' + (st.today.getFullYear() == k ? ' class="today"' : '') + ' id="calendar_year_' + k + '">' + k + '</span></a>';
        }
        s += '</div>';
        s += '<div id="calendar_month" class="calendar-select" onclick="doane(event)" style="display: none">';
        for (var k = 1; k <= 12; k++) {
            s += '<a href="###" onclick="dk_calendar.refreshcalendar(yy, ' + (k - 1) + ');dk_calendar.$i(\'calendar_month\').style.display=\'none\'"><span' + (st.today.getMonth() + 1 == k ? ' class="today"' : '') + ' id="calendar_month_' + k + '">' + k + ( k < 10 ? '&nbsp;' : '') + ' 月</span></a><br />';
        }
        var appendparents = st.$c('div', {id:"calendar_parent",style:"position:absolute;top:0;left:0;"}),
                calendar = st.$c('div', {id:"calendar-box",style:"display:block;position:absolute;",onclick:"doane(event)"}),
                div = st.$c('div');
        //如果是IE6
        if (is_ie && !window.XMLHttpRequest) {
            s = "<iframe frameborder='0' style='position:absolute;top:0;left:0;width:210px ;height:200px;z-index:-1;'></iframe>" + s;
        }
        calendar.innerHTML = s;
        appendparents.appendChild(div.appendChild(calendar));
        //父容器定位=============
        //        if (st.parentid == null) {
        //            document.body.appendChild(appendparents);
        //            st.parentid =false;
        //        } else {
        ////            st.$i(st.parentid).appendChild(appendparents);
        //            document.body.appendChild(appendparents);
        //        }
        document.body.appendChild(appendparents);
        //填入初始化参数===============
        resetArg(st, {calendar:calendar,appendparents:appendparents,div:div,calendar_year:st.$i('calendar_year'),calendar_month:st.$i('calendar_month'),calendariframe:st.$i('calendariframe'),calendariframe_year:st.$i('calendariframe_year'),calendariframe_month:st.$i('calendariframe_month'),dk_confimbox:st.$i("dk_confimbox")});
        document.onclick = function(event) {
            if (st.isOnClick) {
                st.isOnClick = false;
                return false;
            }
            st.calendar.style.display = 'none';
        };
        st.calendar.onclick = function(event) {
            doane(event);
            st.calendar_year.style.display = 'none';
            st.calendar_month.style.display = 'none';
        }
        st.isOnClick = false;
    }

    ;

    //日期格式化=============
    function parsedate(s) {
        var today = new Date();
        if (s == "today")return today;
        /(\d+)\-(\d+)\-(\d+)\s*(\d*):?(\d*)/.exec(s);
        var m1 = (RegExp.$1 && RegExp.$1 > 1899 && RegExp.$1 < 2101) ? parseFloat(RegExp.$1) : today.getFullYear();
        var m2 = (RegExp.$2 && (RegExp.$2 > 0 && RegExp.$2 < 13)) ? parseFloat(RegExp.$2) : today.getMonth() + 1;
        var m3 = (RegExp.$3 && (RegExp.$3 > 0 && RegExp.$3 < 32)) ? parseFloat(RegExp.$3) : today.getDate();
        var m4 = (RegExp.$4 && (RegExp.$4 > -1 && RegExp.$4 < 24)) ? parseFloat(RegExp.$4) : 0;
        var m5 = (RegExp.$5 && (RegExp.$5 > -1 && RegExp.$5 < 60)) ? parseFloat(RegExp.$5) : 0;
        /(\d+)\-(\d+)\-(\d+)\s*(\d*):?(\d*)/.exec("0000-00-00 00\:00");
        return new Date(m1, m2 - 1, m3, m4, m5);
    }
}
;
