	$(function(){
		//添加和修改
		$(".sub").click(function(){
			var id=this.id;
			var form=id.replace("sub","");
			if(form==2){
				swal({
			          text: "添加成功",
			          type: "success",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#4cd964',
			          timer:1000,
			      })
			}else{
				swal({
			          text: "修改成功",
			          type: "success",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#4cd964',
			          timer:1000,
			      })
			}
			setTimeout(function(){$("#f"+form).submit();},1500);
		})
		//验证
		$(".verification").click(function(){
			var id=this.id;
			var str=id.substring(4);
			var dname=$("#dname"+str).val();
			var address=$("#address"+str).val();
			var tel=/^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/;
			var customerp=$("#customerp"+str).val();
			var fperson=$("#fperson"+str).val();
			var pho=/^1[34578]\d{9}$/;
			var fphone=$("#fphone"+str).val();
			if(dname.length==0){
				swal({
			          text: "请填写小区名称",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(address.length==0){
				swal({
			          text: "请填写小区详细地址",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(customerp.length==0){
				swal({
			          text: "请填写客服电话",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(!tel.test(customerp)){
				swal({
			          text: "客服电话格式有误",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(fperson.length==0){
				swal({
			          text: "请填写负责人",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(fphone.length==0){
				swal({
			          text: "请填写负责人电话",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(!pho.test(fphone)){
				swal({
			          text: "负责人电话有误",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else{
				datacenterController.selectDname(dname,function(data){
					if(str==2){
						if(data!=0){
							swal({
						          text: "小区名称已存在",
						          type: "warning",
						          confirmButtonText: 'OK',
						          confirmButtonColor: '#f8bb86',
						          timer:1000,
						      })
						      $("#myModal"+str).modal("show");
						}else{
							$("#myModal"+str).modal("hide");
							str=str+str;
							$("#myModal"+str).modal("show");
						}
					}else{
						$("#myModal"+str).modal("hide");
						str=str+str;
						$("#myModal"+str).modal("show");
					}
				})
			}
		})
	})	
	
	
	//编辑
	function edit(disid){
		datacenterController.editDis(disid,function(data){
			dwr.util.setValue("disid3",data.disid);
			dwr.util.setValue("dname3",data.dname);
			$("#city1").citySelect({
                prov:data.prov,//省
                city:data.city,//市
                dist:data.dist,//区
                nodata: "none"
            });
			dwr.util.setValue("address3",data.address);
			dwr.util.setValue("customerp3",data.customerp);
			dwr.util.setValue("fperson3",data.fperson);
			dwr.util.setValue("fphone3",data.fphone);
			if(data.logo!=null){
				$("#img1").attr("src","/wyht/img/"+data.logo);
				$("#img1").removeClass("hide");
				$("#span1").html("");//去掉“+”号
			}
			dwr.util.setValue("description3",data.description);
			dwr.util.setValue("zarea3",data.zarea);
			dwr.util.setValue("jarea3",data.jarea);
			dwr.util.setValue("garea3",data.garea);
			dwr.util.setValue("larea3",data.larea);
			dwr.util.setValue("carea3",data.carea);
			dwr.util.setValue("carcount3",data.carcount);
			dwr.util.setValue("housecount3",data.housecount);
			dwr.util.setValue("remark3",data.remark);
			layui.use('form', function(){
				var form=layui.form;
				form.render();
			});
		})
	}
	
	//清空
	function clear_form(){
		$("#dname").val("");
		$("#f1").submit();
	} 
	
	//复选框：修改小区状态
	function status(disid,sta){
		datacenterController.updata_status(disid,sta,function(data){
			if(data==0){
				swal({
					text : "操作失败！",
					type : "error",
					confirmButtonText : '确认',
					confirmButtonColor : '#4cd964',
					timer : 1000,
				})
			}else{
				if(sta==0) {
					swal({
						text : "开启成功！",
						type : "success",
						confirmButtonText : '确认',
						confirmButtonColor : '#4cd964',
						timer : 1000,
					})
				}else{
					swal({
						text : "关闭成功！",
						type : "success",
						confirmButtonText : '确认',
						confirmButtonColor : '#4cd964',
						timer : 1000,
					})
				}
				//延时刷新页面
				setTimeout("location.reload()",1500);
			}
		})
	}
	$(function(){
			$.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js', function (_result) {
	            if (remote_ip_info.ret == '1') {
	                //alert('国家：' + remote_ip_info.country + '\n省：' + remote_ip_info.province + '\n市：' + remote_ip_info.city + '\n区：' + remote_ip_info.district + '\nISP：' + remote_ip_info.isp + '\n类型：' + remote_ip_info.type + '\n其他：' + remote_ip_info.desc);
	                //将当前位置的先附在下拉框中
	                $("#city").citySelect({
	                    prov:remote_ip_info.province,//省
	                    city:remote_ip_info.city,//市
	                    dist:remote_ip_info.district,//区
	                    nodata: "none"
	                });
	            } else {
	                alert('没有找到匹配的IP地址信息！');
	            }
		});
		/*
		Ajax 三级省市联动
		日期：2012-7-18

		settings 参数说明
		-----
		url:省市数据josn文件路径
		prov:默认省份
		city:默认城市
		dist:默认地区（县）
		nodata:无数据状态
		required:必选项
		------------------------------ */
		(function($){
		    $.fn.citySelect=function(settings){
		        if(this.length<1){return;};
		        // 默认值
		        settings=$.extend({
		            url:"/wyht/js/city.min.js",
		            prov:null,
		            city:null,
		            dist:null,
		            nodata:null,
		            required:true
		        },settings);

		        var box_obj=this;
		        var prov_obj=box_obj.find(".prov");
		        var city_obj=box_obj.find(".city");
		        var dist_obj=box_obj.find(".dist");
		        var prov_val=settings.prov;
		        var city_val=settings.city;
		        var dist_val=settings.dist;
		        var select_prehtml=(settings.required) ? "" : "<option value=''>请选择</option>";
		        var city_json;

		        // 赋值市级函数
		        var cityStart=function(){
		            var prov_id=prov_obj.get(0).selectedIndex;
		            if(!settings.required){
		                prov_id--;
		            };
		            city_obj.empty().attr("disabled",true);
		            dist_obj.empty().attr("disabled",true);

		            if(prov_id<0||typeof(city_json.citylist[prov_id].c)=="undefined"){
		                if(settings.nodata=="none"){
		                    city_obj.css("display","none");
		                    dist_obj.css("display","none");
		                }else if(settings.nodata=="hidden"){
		                    city_obj.css("visibility","hidden");
		                    dist_obj.css("visibility","hidden");
		                };
		                return;
		            };

		            // 遍历赋值市级下拉列表
		            temp_html=select_prehtml;
		            $.each(city_json.citylist[prov_id].c,function(i,city){
		                temp_html+="<option value='"+city.n+"'>"+city.n+"</option>";
		            });
		            city_obj.html(temp_html).attr("disabled",false).css({"display":"","visibility":""});
		            layui.use("form", function(){
	        			var form=layui.form;
	        	        form.render();
	                });
		            distStart();
		        };

		        // 赋值地区（县）函数
		        var distStart=function(){
		            var prov_id=prov_obj.get(0).selectedIndex;
		            var city_id=city_obj.get(0).selectedIndex;
		            if(!settings.required){
		                prov_id--;
		                city_id--;
		            };
		            dist_obj.empty().attr("disabled",true);

		            if(prov_id<0||city_id<0||typeof(city_json.citylist[prov_id].c[city_id].a)=="undefined"){
		                if(settings.nodata=="none"){
		                    dist_obj.css("display","none");
		                }else if(settings.nodata=="hidden"){
		                    dist_obj.css("visibility","hidden");
		                };
		                return;
		            };

		            // 遍历赋值市级下拉列表
		            temp_html=select_prehtml;
		            $.each(city_json.citylist[prov_id].c[city_id].a,function(i,dist){
		                temp_html+="<option value='"+dist.s+"'>"+dist.s+"</option>";
		            });
		            dist_obj.html(temp_html).attr("disabled",false).css({"display":"","visibility":""});
		            layui.use("form", function(){
	        			var form=layui.form;
	        	        form.render();
	                });
		        };

		        var init=function(){
		            // 遍历赋值省份下拉列表
		            temp_html=select_prehtml;
		            $.each(city_json.citylist,function(i,prov){
		                temp_html+="<option value='"+prov.p+"'>"+prov.p+"</option>";
		            });
		            prov_obj.html(temp_html);

		            // 若有传入省份与市级的值，则选中。（setTimeout为兼容IE6而设置）
		            setTimeout(function(){
		                if(settings.prov!=null){
		                    prov_obj.val(settings.prov);
		                    cityStart();
		                    setTimeout(function(){
		                        if(settings.city!=null){
		                            city_obj.val(settings.city);
		                            distStart();
		                            setTimeout(function(){
		                                if(settings.dist!=null){
		                                    dist_obj.val(settings.dist);
		                                };
		                            },1);
		                        };
		                    },1);
		                };
		            },1);

		            // 选择省份时发生事件
		            //prov_obj.bind("change",function(){
		            layui.use("form",function(){
		            	var form=layui.form;
		            	form.on("select(prov)",function(data){
		            		cityStart();
		            	});
		            	form.on("select(city)",function(data){
		            		 distStart();
		            	})
		            });

		            // 选择市级时发生事件
//		            city_obj.bind("change",function(){
//		                distStart();
//		            });
		        };

		        // 设置省市json数据
		        if(typeof(settings.url)=="string"){
		            $.getJSON(settings.url,function(json){
		                city_json=json;
		                init();
		            });
		        }else{
		            city_json=settings.url;
		            init();
		        };
		    };
		})(jQuery);
	})
