(function(a) {
    a.fn.wBox = function(o) {
        var f = {
            wBoxURL: "wbox/",
            opacity: 0.5,
            callBack: null,
            noTitle: false,
            show: false,
            timeout: 0,
            target: null,
            requestType: null,
            title: "wBox Title",
            drag: true,
            fix_style: null,
            iframeWH: {
                width: 400,
                height: 300
            },
            html: ""
        },
        j = this;
        this.YQ = a.extend(f, o);
        var n = '<div id="wBox"><div class="wBox_popup"><table><tbody><tr><td class="wBox_tl"/><td class="wBox_b"/><td class="wBox_tr"/></tr><tr><td class="wBox_b"><div style="width:10px;">&nbsp;</div></td><td><div class="wBox_body">' + (j.YQ.noTitle ? "": '<table class="wBox_title"><tr><td class="wBox_dragTitle"><div class="wBox_itemTitle">' + j.YQ.title + '</div></td><td width="20px" title="\u5173\u95ed"><div class="wBox_close"></div></td></tr></table> ') + '<div class="wBox_content" id="wBoxContent"></div></div></td><td class="wBox_b"><div style="width:10px;">&nbsp;</div></td></tr><tr><td class="wBox_bl"/><td class="wBox_b"/><td class="wBox_br"/></tr></tbody></table></div></div>',
        c = null,
        b = null,
        d = a(window),
        g = a(this);
        this.showBox = function() {
            // custom width

            a("#wBox_overlay").remove();
            a("#wBox").remove();
            c = a("<div id='wBox_overlay' class='wBox_hide'></div>").hide().addClass("wBox_overlayBG").css("opacity", j.YQ.opacity).dblclick(function() {
                j.close()
            }).appendTo("body").fadeIn(300);

            b = a(n).appendTo("body");
            i();
        };
        function i() {
            var p = b.find("#wBoxContent");
            if (j.YQ.requestType && a.inArray(j.YQ.requestType, ["iframe", "ajax", "img"]) != -1) {
                p.html("<div class='wBox_load'><div id='wBox_loading'><img src='" + j.YQ.wBoxURL + "loading.gif' /></div></div>");
                if (j.YQ.requestType === "img") {
                    var q = a("<img />");
                    q.attr("src", j.YQ.target);
                    q.load(function() {
                        q.appendTo(p.empty());
                        m()
                    })
                } else {
                    if (j.YQ.requestType === "ajax") {
                        a.get(j.YQ.target,
                        function(r) {
                            p.html(r);
                            b.find(".wBox_close").click(j.close);
                            m()
                        })
                    } else {
                        ifr = a("<iframe name='wBoxIframe' style='width:" + j.YQ.iframeWH.width + "px;height:" + j.YQ.iframeWH.height + "px;' scrolling='auto' frameborder='0' src='" + j.YQ.target + "'></iframe>");
                        ifr.appendTo(p.empty());
                        ifr.load(function() {
                            try {
                                $it = a(this).contents();
                                $it.find(".wBox_close").click(j.close);
                                fH = $it.height();
                                fW = $it.width();
                                w = d;
                                newW = Math.min(w.width() - 40, fW);
                                newH = w.height() - 25 - (j.YQ.noTitle ? 0: 30);
                                newH = Math.min(newH, fH);
                                if (!newH) {
                                    return
                                }
                                var r = k(newW);

                                b.css({
                                    left: r[0],
                                    top: r[1]
                                });
                                a(this).css({
                                    height: newH,
                                    width: newW
                                })
                            } catch(s) {}
                        })
                    }
                }
            } else {
                if (j.YQ.target) {
                    a(j.YQ.target).clone(true).show().appendTo(p.empty())
                } else {
                    if (j.YQ.html) {
                        p.html(j.YQ.html)
                    } else {
                        g.clone(true).show().appendTo(p.empty())
                    }
                }
            }
            e()
        }
        function e() {
            m();
            b.show().find(".wBox_close").click(j.close).hover(function() {
                a(this).addClass("on")
            },
            function() {
                a(this).removeClass("on")
            });
            a(document).unbind("keydown.wBox").bind("keydown.wBox",
            function(p) {
                if (p.keyCode === 27) {
                    j.close()
                }
                return true
            });
            typeof j.YQ.callBack === "function" ? j.YQ.callBack() : null; ! j.YQ.noTitle && j.YQ.drag ? h() : null;
            if (j.YQ.timeout) {
                setTimeout(j.close, j.YQ.timeout)
            }
        }
        function m() {
            if (!b) {
                return false
            }

            if (j.YQ.fix_style){
                b.width(j.YQ.fix_style.width);
            }
            var u = b.width();
            r = k(u);

            b.css({
                left: r[0],
                top: r[1]
            });
            var q = a("body").height(),
            p = d.height(),
            s = a("html").height();
            q = Math.max(q, p);
            c.height($(document).height()).width(d.width())
        }
        function k(p) {
            l = (d.width() - p) / 2;
            t = d.scrollTop() + d.height() / 9;
            return [l, t]
        }
        function h() {
            var u,
            r,
            s;
            var x = b.find(".wBox_dragTitle").css("cursor", "move");
            x.bind("selectstart",
            function() {
                return false
            });
            x.mousedown(function(y) {
                u = y.clientX - parseInt(b.css("left"));
                r = y.clientY - parseInt(b.css("top"));
                b.mousemove(q).mouseout(v).css("opacity", 0.8);
                x.mouseup(p)
            });
            function q(y) {
                s = false;
                if (y.clientX - u < 0) {
                    l = 0
                } else {
                    if (y.clientX - u > d.width() - b.width()) {
                        l = d.width() - b.width()
                    } else {
                        l = y.clientX - u
                    }
                }
                b.css({
                    left: l,
                    top: y.clientY - r
                })
            }
            function v(y) {
                s = true;
                setTimeout(function() {
                    s && p(y)
                },
                10)
            }
            function p(y) {
                b.unbind("mousemove", q).unbind("mouseout", v).css("opacity", 1);
                x.unbind("mouseup", p)
            }
        }
        this.close = function() {
            if (b) {
                c.remove();
                b.stop().fadeOut(300,
                function() {
                    b.remove()
                })
            }
        };
        d.resize(function() {
            m()
        });
        j.YQ.show ? j.showBox() : g.click(function() {
            j.showBox();
            return false
        });
        return this
    }
})(jQuery);
