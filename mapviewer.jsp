<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@taglib uri="http://www.esri.com/adf/web" prefix="a"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ page language="java" import="java.util.Locale" %>

<html>
  <head>
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8">
    <title>monitoring</title>
    
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
    
    <link rel="stylesheet" href="css/soria.all.css.min.css" type="text/css"></link>
    <link rel="stylesheet" href="css/adf.css" type="text/css"></link>
    <link rel="stylesheet" href="css/wma.css" type="text/css"></link>
    <link rel="stylesheet" href="css/themes/aqua/aqua.css" type="text/css"></link>  
    
    <style  type="text/css" media="all">
     /*Стили для окна выбора и загрузки карт*/
    #div1{ /*главный слой окна задачи выбора карты*/
    	position:absolute;
		width:450px;
		height:280px;
		left:450px;
		top:250px;
		background-color:#f1f1f1;
		border-top:#5c5c5c 1px solid;
		border-left:#5c5c5c 1px solid;
		border-bottom:#5c5c5c 1px solid;
		border-right:#5c5c5c 1px solid;
		visibility:hidden;
		z-index:9999;
		overflow:auto;
    	}
    #title{/*стиль для заголовка окна*/
    	position:absolute;
    	width:100%;
    	height:24px;
    	background-image: url("css/themes/aqua/gradient-aqua-1x24.gif");
    	}
    #close{ /*для картинки close*/
    	position:absolute;
    	width:20px;
    	height:100%;
    	right:0px;
    	}
	#text_title{ /*текст заголовка*/
		position:absolute;
		left:0px;
		color:#ffffff;/*цвет фона*/
		font-weight:bold;/*жирный шрифт*/
		margin-left:3px; /*отступ слева;*/
		margin-top:2px;  /*отступ сверху;*/
		}
	#select_map_text{/*геологическая карта*/
		position:absolute;
		top:18%;
		left:32%;
		/*font-family: Arial;*/
		/*font-size: 100%;*/
		}
	#select_map{/*список геологических карт*/
		position:absolute;
		top:30%;
		left:11%;
		}
	#select_map_button{/*стиль для кнопки загрузки геологической карты*/
		position:absolute;
		top:80%;
		left:40%;
		}
			
	/*Стили для окна задачи поиска*/	
	#search_div{ /*Стиль основного окна задачи поиска*/
		position:absolute;
		width:335px;
		height:250px;
		left:250px;
		top:250px;
		background-color:#f1f1f1;
		border-top:#5c5c5c 1px solid;
		border-left:#5c5c5c 1px solid;
		border-bottom:#5c5c5c 1px solid;
		border-right:#5c5c5c 1px solid;
		visibility:hidden;
		z-index:9999;
		overflow:auto;
		}
	#title_s{ /*стиль для заголовка окна*/
    	position:absolute;
    	width:100%;
    	height:24px;
    	background-image: url("css/themes/aqua/gradient-aqua-1x24.gif");
    	}
    #text_title_s{ /*текст заголовка*/
		position:absolute;
		left:0px;
		color:#ffffff;/*цвет фона*/
		font-weight:bold;/*жирный шрифт*/
		margin-left:3px; /*отступ слева;*/
		margin-top:2px;  /*отступ сверху;*/
		}
	#close_s{ /*для картинки close*/
		position:absolute;
    	width:20px;
    	height:100%;
    	right:0px;
		}
	#text1_s{ /*стиль слоя для лейбла "название объекта" */
		position:absolute;
		top:50px;
		left:40px;
		overflow:hide;
		font-family: Arial;
		font-size: 110%;
		}
	#name_s{ /*стиль слоя для текстового поля ввода*/
		position:absolute;
		top:75px;
		left:40px;
		overflow:hide;
		}
		
	#text2_s{ /*стиль слоя для лейбла "место поиска" */
		position:absolute;
		top:115px;
		left:40px;
		overflow:hide;
		font-family: Arial;
		font-size: 110%;
		}
	#place_s{ /*стиль слоя для выкидного списка*/
		position:absolute;
		top:140px;
		left:40px;
		overflow:hide;
		}
	#enter_s{ /*стиль слоя для кнопки*/
		position:absolute;
		top:190px;
		left:107px;
		overflow:hide;
		}
		
	/*стили для окна атрибутов*/
	.window_style{ /*стиль окна атрибутов*/
		min-height:250px;
		min-width:350px;
		max-height:350px;
		max-width:450px;
		position:absolute;
		width:400px;
		height:200px;
		background-color:#f1f1f1;
		border-top:#00584e 1px solid;
		border-left:#00584e 1px solid;
		border-bottom:#00584e 1px solid;
		border-right:#00584e 1px solid;
		z-index:9999;		
		}
	.title_style{/*стиль заголовка окна атрибутов*/
		position:relative;
    	width:100%;
    	height:24px;
    	background-image: url("images/mpr/panel-35p.gif");
		color:#fff;
		border-bottom:#00584e 1px solid;
		font-weight: bold;
		font-family: Arial;
		font-size: 90%;
		}
	.cont_style{/*окно для атрибутов*/
		margin-left:2%;
		margin-bottom:2%;
		position:relative;
		width:96%;
		height:81%;
		top:5px;
		background-color:#fff;
		}
	.border_style{/*стидь внутренней рамки окна атрибутов*/
		border-top:#00584e 1px solid;
		border-left:#00584e 1px solid;
		border-bottom:#00584e 1px solid;
		border-right:#00584e 1px solid;
		overflow:scroll;
		height:100%;
		}
	.vr_style{ /*стиль для текущей строки ключ-значение атрибута*/
		background-color:#fff;
		border-bottom:#5c5c5c 1px solid;/*подчеркивание для текущей строки*/
		margin-top:5px;
		overflow:auto;/*добавить полосы прокрутки если содержимое атрибута выходит за рамки текущего поля*/
		}
	.close_style{ /*стиль для значка закрытия окна*/
    	position:absolute;
		top:0px;
    	height:100%;
    	right:0px;
		}
	
	/*стили для стрелок окна атрибутов*/
	.arrow-up-left {
		position:relative;
		top:-244px;
		left:-1px;
		width: 0; 
		height: 0; 
		border-left: 7px solid transparent;
		border-right: 7px solid transparent;
		border-bottom: 7px solid black;
		visibility:hidden;
		}

	.arrow-up-right {
		position:relative;
		top:-251px;
		left:387px;
		width: 0; 
		height: 0; 
		border-left: 7px solid transparent;
		border-right: 7px solid transparent;
		border-bottom: 7px solid black;
		visibility:hidden;
		}
	
	.arrow-down-left {
		position:relative;
		left:-1px;
		width: 0; 
		height: 0; 
		border-left: 7px solid transparent;
		border-right: 7px solid transparent;
		border-top: 7px solid black;
		visibility:hidden;
		}
	
	.arrow-down-right{
		position:relative;
		top:-7px;
		width: 0; 
		height: 0; 
		left:387px;
		border-left: 7px solid transparent;
		border-right: 7px solid transparent;
		border-top: 7px solid black;
		visibility:hidden;
		}
		
	/*стили для окна прогнозных ресурсов*/
	.win_pr{ /*стиль окна прогнозных ресурсов*/
		position:absolute;
		width:600px;
		height:380px;
		background-color:#f1f1f1;
		border-top:#00584e 1px solid;
		border-left:#00584e 1px solid;
		border-bottom:#00584e 1px solid;
		border-right:#00584e 1px solid;
		z-index:9999;		
		}
	.title_pr{/*стиль заголовка окна атрибутов*/
		position:relative;
    	width:100%;
    	height:35px;
    	background-image: url("images/mpr/panel-35p.gif");
		color:#fff;
		border-bottom:#00584e 1px solid;
		font-weight: bold;
		font-family: Arial;
		font-size: 90%;
		}
	.close_pr{ /*стиль для значка закрытия окна*/
    	position:absolute;
		top:0px;
    	height:100%;
    	right:0px;
		}
	.div_name{ /*стиль для слоя, содержащего название прогнозного объекта*/
		position:relative;
		width:100%;
		height:17px;
		margin: 12px 0 0 0; /*отступ от "шапки" окна до названия объекта прогнозирования*/
		text-align: center;
		overflow:auto;
		}
	.div_cont{ /*стиль для слоя, содержащего таблицу прогнозных ресурсов*/
		position:relative;
		width:100%;
		height:280px;
		align:center;
		text-align: center;
		overflow:auto;
		margin: 0 auto;
		}
	.table_style{ /*стиль для таблицы прогнозных ресурсов*/
		position:relative;
		top:12px;/*отступ таблицы от названия объекта прогнозирования*/
		border-collapse:collapse;
		overflow:hide;
		}
	.tr_style{
		background-color:#ffffff;
		}
	.tr_style_sum{ /*стиль для строки таблицы, содержащей суммарные оценки прогнозных ресурсов */
		background-color:#9eeff6;
		}
	.td_style{ /*стиль для */
		border:2px solid #949494;
		width:140px;
		}
		
	A{/* Устанавливает цвет и убирает подчеркивание для ссылки "справка" */
    	text-decoration: none;
		color:#ffffff;
		font-family: Arial;
		font-size: 110%;
		font-weight: bold;
    	}	 
	A:hover { /*Наведение на ссылку "справка"*/
		color: #c7ffd4; 
   	 	text-decoration: none;
   	 	font-weight: bold;
   	 	font-family: Arial;
		font-size: 110%;
		}  
    </style>
    
    <script type="text/javascript" language="javascript" src="js/esri/dojo/dojo.js" djConfig="locale:'<%=Locale.getDefault().toString().replace('_', '-').toLowerCase()%>' "></script>
    <script type="text/javascript">
      adfdojo.require("adf.adf");
      adfdojo.require("wma.app");
      adfdojo.requireLocalization("resource","adf");
      adfdojo.requireLocalization("resource","wma");
      
      adfdojo.addOnLoad(function() {
        if (wma) {
          wma.init();
        }
      });
    </script>

	<script type="text/javascript">
	function click1(ev){ //функция определяет координаты клика мыши
      	x_click = ev.clientX;
      	y_click = ev.clientY;
  		}
  
	function init(){
		details = new Object();
		//register postback tag handler
		adf.Controls.addPostBackTagHandler("click", clickTagHandler);
		}

	function clickTagHandler(xml, eventSources) {		
		//-------------------------------заполнить таблицу прогнозных ресурсов значениями
		//получить значения XML-ответа для прогнозных ресурсов
		name_object = xml.getElementsByTagName("name").item(0).firstChild.nodeValue;
		
	 	pk1 = xml.getElementsByTagName("pk1").item(0).firstChild.nodeValue;  
		pk2 = xml.getElementsByTagName("pk2").item(0).firstChild.nodeValue;
		pk3 = xml.getElementsByTagName("pk3").item(0).firstChild.nodeValue;
		pr1 = xml.getElementsByTagName("pr1").item(0).firstChild.nodeValue;
		pr2 = xml.getElementsByTagName("pr2").item(0).firstChild.nodeValue;	  
		pr3 = xml.getElementsByTagName("pr3").item(0).firstChild.nodeValue;
		var but_pr = document.getElementById('but_view_pr');//объект - кнопка для визуализации прогнозных ресурсов
		if((pk1=='-')&&(pk2=='-')&&(pk3=='-')&&(pr1=='-')&&(pr2=='-')&&(pr3=='-')){//если нет сведений о прогнозных ресурсах объекта или объект не относится к прогнозному объекту
			if(!but_pr.disabled){//если кнопка активна
				but_pr.disabled=true;//сделать кнопку не активной
				}
			if (document.getElementById('win_pr')){//если окно создано  не создавать окно повторно
				document.body.removeChild(document.getElementById('win_pr')); //удалить окно
				}
			}	
		else{//если есть информация о прогнозных ресурсах 
			but_pr.disabled=false;//активировать кнопку открытия окна с прогнозными ресурсами

			pk1 = point(roundPlus(pk1,4));//в случае необходимости округлить до четырех знаков после запятой и привести к десятичному виду округленные значения
			pk2 = point(roundPlus(pk2,4));
			pk3 = point(roundPlus(pk3,4));
			pr1 = point(roundPlus(pr1,4));
			pr2 = point(roundPlus(pr2,4));
			pr3 = point(roundPlus(pr3,4));

			pk_all=sum_p(pk1,pk2,pk3);//вычислить итоговые поля (sum_p)
			pr_all=sum_p(pr1,pr2,pr3);
			p1_all=sum_p(pk1,pr1,"-");
			p2_all=sum_p(pk2,pr2,"-");
			p3_all=sum_p(pk3,pr3,"-");
			p_all=sum_p(pk_all,pr_all,"-");

			pk_all = point(roundPlus(pk_all,4));//в случае необходимости округлить до четырех знаков после запятой и привести к десятичному виду округленные значения
			pr_all = point(roundPlus(pr_all,4));
			p1_all = point(roundPlus(p1_all,4));
			p2_all = point(roundPlus(p2_all,4));
			p3_all = point(roundPlus(p3_all,4));
			p_all = point(roundPlus(p_all,4)); 

			if (document.getElementById('win_pr')){//если окно создано - не создавать окно повторно
				//присвоить ячейкам таблицы значения прогнозных ресурсов	
				document.getElementById("name-object").innerHTML = name_object;
				document.getElementById("pk1").innerHTML = pk1;
				document.getElementById("pk2").innerHTML = pk2;
				document.getElementById("pk3").innerHTML = pk3;
				document.getElementById("pr1").innerHTML = pr1;
				document.getElementById("pr2").innerHTML = pr2;
				document.getElementById("pr3").innerHTML = pr3;	 

				//присвоить ячейкам таблицы итоговые значения
				document.getElementById("pk_all").innerHTML = pk_all;
				document.getElementById("pr_all").innerHTML = pr_all;
				document.getElementById("p1_all").innerHTML = p1_all;
				document.getElementById("p2_all").innerHTML = p2_all;
				document.getElementById("p3_all").innerHTML = p3_all;
				document.getElementById("p_all").innerHTML = p_all;
				}
			}
		
		details = xml.getElementsByTagName("detail");//получить список атрибутов

		var ret=0;//переменная, определяющая нужно ли создавать окно атрибутов(не нужно создавать когда открыта схема районов или отсутствуют атрибуты)
		var load_button = document.getElementById("but_view_all");//элемент кнопка для просмотра описания объекта
		if(!load_button.disabled){load_button.disabled = true;}//если кнопка активна - сделать неактивной
		
		if(details.length>0){//если объект выделен
			for(var j=0;j<details.length;j++){//перебор атрибутов
				var current_attribute = details.item(j);//текущий атрибут выделенного объекта
				var des_key = current_attribute.getAttribute('key');//получить название атрибута выделенного объекта
				if(des_key=='shema_rayonov'){//если в данный момент загружена схема районов(существует пара ключ-значение shema_rayonov, определенная в select_rayon.java)
					document.getElementById("name-rayon").innerHTML = name_object;
					if(document.getElementById('attribute_window')){//если окно было создано до загрузки обзорной карты - удалить его
						document.body.removeChild(document.getElementById('attribute_window'));
						}
					ret=1;//не создавать окно на схеме районов(return)
					}
				if((des_key=='описание')||(des_key=='Описание')){//если объект содержит атрибут описания
					var des_val = current_attribute.getAttribute('value');//значение атрибута описания
					if((des_val!='Null')&&(des_val!='null')&&(des_val.length>4)){//если поле не пустое и больше четырех символов
						load_button.disabled = false;//активировать кнопку загрузки файла
						}
					}
				}//for
			}
		else{//если объект не выбран - не создавать окно
			if(document.getElementById('attribute_window')){//если окно атрибутов создано
				document.body.removeChild(document.getElementById('attribute_window'));//удалить окно атрибутов
				}
			ret=1;//не создавать окно(return;)
			}

		if(ret==1) return;
		
		if (!document.getElementById('attribute_window')){ //если окно не создано - создать
			create();//функция создает объект окна атрибутов
			}
		
		var win=document.getElementById('attribute_window');

		//определение ширины и длины окна браузера
		var myWidth = 0, myHeight = 0;
		if( typeof( window.innerWidth ) == 'number' ) {
		    //Non-IE
		    myWidth = window.innerWidth;
		    myHeight = window.innerHeight;
		  	} 
	  	else if( document.documentElement && ( document.documentElement.clientWidth || 
		document.documentElement.clientHeight ) ) {
		    //IE 6+ in 'standards compliant mode'
		    myWidth = document.documentElement.clientWidth;
		    myHeight = document.documentElement.clientHeight;
		  	}
	  	else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
		    //IE 4 compatible
		    myWidth = document.body.clientWidth;//ширина и длина окна браузера
		    myHeight = document.body.clientHeight;
		  	}

		  //скрыть все стрелки до начала идентификации
		document.getElementById('arrow1').style.visibility='hidden';
		document.getElementById('arrow2').style.visibility='hidden';
		document.getElementById('arrow3').style.visibility='hidden';
		document.getElementById('arrow4').style.visibility='hidden';
		  
		//ниже код - обеспечивает правильное отображение окна атрибутов, чтобы оно не выходило за рамки карты
		if((myWidth-x_click<450)&&(myHeight-y_click<300)){//нижний правый угол окна атрибутов
			var w = x_click-395;//отнять от x-координаты щелчка ширину окна атрибутов
			win.style.left = w+'px';
			var h = y_click-259;//отнять от y-координаты щелчка высоту окна атрибутов
			win.style.top = h+'px';
			document.getElementById('arrow1').style.visibility='visible';//сделать видимой стрелку на объект
			}
		else if((myWidth-x_click>=450)&&(myHeight-y_click<300)){//нижний левый угол окна атрибутов(если окно атрибутов слишком близко к нижнему краю браузера, развернуть окно наверх)
			var w = x_click-7;
			win.style.left=w+'px';
			var h = y_click-259;//отнять от y-координаты щелчка высоту окна атрибутов
			win.style.top = h+'px';
			document.getElementById('arrow2').style.visibility='visible';
			}	
		else if((myWidth-x_click<450)&&(myHeight-y_click>=300)){//верхний правый угол окна атрибутов(если окно атрибутов слишком близко к правому краю браузера - развернуть окно налево)
			var w = x_click-395;//отнять от x-координаты щелчка ширину окна атрибутов
			var h = y_click+7;
			win.style.left = w+'px';
			win.style.top=h+'px';
			document.getElementById('arrow3').style.visibility='visible';
			}
		else if((myWidth-x_click>=450)&&(myHeight-y_click>=300)){//верхий левый угол окна атрибутов
			var w = x_click-7;
			var h = y_click+7;
			win.style.left=w+'px';
			win.style.top=h+'px';
			document.getElementById('arrow4').style.visibility='visible';
			}
		
		//-----------------------------------вставка атрибутов в созданное окно атрибутов---------------------------------------
		var b = document.getElementById("body_attribute");//тело атрибутов
		if(document.getElementById("border")){ //если существует временное окно, содержащее атрибуты предыдущего объекта удалить его
			b.removeChild(document.getElementById("border"));
			}
		border = document.createElement('div'); //заново создать временное окно, содержащее атрибуты
		border.className = 'border_style';
		border.id='border';
		buf = document.createElement('div');//временный слой для текущих атрибутов
		buf.id="buf_div";
		if(details.length>0){//если количество атрибутов больше нуля(т.е. объект выбран)
			for (var i=0;i<details.length;i++) {//перебор всех атрибутов
				var detail = details.item(i);//текущая пара ключ-значение
				var vr = document.createElement('div');
				vr.innerHTML = '<span style="margin-left:5px;font-weight: bolder;font-family: Arial;font-size:small;">'+detail.getAttribute('key')+'</span>'+' : '+'<span style="font-family: Arial;font-size:small;">'+detail.getAttribute('value')+'</div>';vr.className='vr_style';
				buf.appendChild(vr);//добавить текущую запись во временное окно 
				}
			border.appendChild(buf); //добавить массив атрибутов во временное окно
			b.appendChild(border);//добавить в тело атрибутов временное окно, содержащее текущие атрибуты
			}
		else{
			b.appendChild(border);
			}		
		}

	function point(string_number){ //функция добовляет к круглым значениям строки нулевой остаток(".0")
		string_number+="";//преобразовать в строку
		if (string_number=="-")return string_number;
		p = false;
		for (i=0;i<string_number.length;i++){//перебор всех символов строки
			if (string_number.charAt(i)=="."){//если встречен символ "."
				p = true;break;//значит число не округляется
				}
			}
		if (p!=true)string_number+=".0";//иначе, если значение целое, без дробной части, добавить символы .0
		return string_number;
		}
		
	//http://javascript.ru/forum/misc/2860-okruglenie-do-nuzhnogo-kolichestva-znakov-posle-zapyatojj.html
	function roundPlus(x, n) { //x - число, n - количество знаков
		if(x=='-')return "-";
		if(isNaN(x) || isNaN(n)) return "-";
		var m = Math.pow(10,n);
		return (Math.round(x*m)/m);
		}

	function sum_p(p1,p2,p3){ //функция суммирует ресурсы для итоговых значений		
		var p_all=0;
		if(p1!="-")p_all+=parseFloat(p1);//строку в вещественное число		
		if(p2!="-")p_all+=parseFloat(p2);					
		if(p3!="-")p_all+=parseFloat(p3);
		if (p_all==0)p_all="-";
		return p_all;
		}
	
  //----------------------------------------------Функция для создания окна атрибутов----------------------------------
	function create(){
		var win = document.createElement('div');//создание слоя окна
		win.className = 'window_style';//стиль общего окна
		win.id = 'attribute_window';
		var title = document.createElement('div');//создание слоя заголовка
		title.className = 'title_style';//стиль заголовка
		title.innerHTML = "<div style='position:absolute;margin-top:2px;margin-left:4px;'><span style='color:#fff;font-weight: bolder;font-family: Arial;font-size: 110%;'>Атрибуты объекта</span></div>";//текст заголовка
		var cont = document.createElement('div');
		cont.className = 'cont_style';
		cont.id = "body_attribute";
		border = document.createElement('div');
		border.className = 'border_style';
		border.id='border';
		if ((details.length!=undefined)&&(details.length>0)){//если есть текущие атрибуты
			if(document.getElementById("buf_div")){//если окно с атрибутами заполнено атрибутами
				cont.removeChild(document.getElementById("buf_div"));//удалить все записи
				}
			buf = document.createElement('div');//временный слой для текущих атрибутов
			buf.id="buf_div";
			for (var i=0;i<details.length;i++) {//перебор всех атрибутов
				var detail = details.item(i);//текущая пара ключ-значение
				var vr = document.createElement('div');
				vr.innerHTML = '<span style="margin-left:5px;font-weight: bolder;font-family: Arial;font-size:small;">'+detail.getAttribute('key')+'</span>'+' : '+'<span style="font-family: Arial;font-size:small;">'+detail.getAttribute('value')+'</div>';
				vr.className='vr_style';
				buf.appendChild(vr);//добавить текущую запись во временное окно 
				}
			//добавить в тело атрибутов временное окно, содержащее текущие атрибуты
			border.appendChild(buf);
			cont.appendChild(border);
			}
		else{
			cont.appendChild(border);
			}
			
		title.onmousedown = function(event){
			event = event || window.event;
			drag=1;
			hidden_arrow=0;
			x2=event.clientX;
			y2 = event.clientY;
			};
			
		title.onmousemove = function(event){
			event = event || window.event;
			if (drag==1){
				x1=event.clientX;    // определяем текущую позицию курсора по Х
				y1=event.clientY;    // определяем текущую позицию курсора по Y
				shift_x=x1-x2;                 // вычисляем разницу (сдвиг)
				shift_y=y1-y2; 
				win.style.left = win.offsetLeft+shift_x+'px';
				win.style.top = win.offsetTop+shift_y+'px';
				x2=x1; y2=y1; // запоминаем предыдущие координаты курсора

				if(hidden_arrow==0){//только в начале смещения окна скрыть стрелку указателя окна атрибутов 
					document.getElementById('arrow1').style.visibility='hidden';
					document.getElementById('arrow2').style.visibility='hidden';
					document.getElementById('arrow3').style.visibility='hidden';
					document.getElementById('arrow4').style.visibility='hidden';
					//присвоить курсору символ перемещения - один раз при начале перемещения окна
					document.body.style.cursor = 'all-scroll';
					hidden_arrow=1;
					}
				}
			};
			
		title.onmouseup = function(){
			drag=0;
			document.body.style.cursor = 'default';
			};
		var close = document.createElement('div');
		close.className = 'close_style';
		var image = document.createElement('img');
		image.src="images/window/close.png";
		image.onclick = function(event) {
			document.body.removeChild(win);
			};	
		image.onmousemove = function(event){ //при событии перемещения окна - отменить перемещение окна(когда указатель находится над изображением)  
			drag=0;
			};
			
		close.appendChild(image);
		title.appendChild(close);
				
		win.appendChild(title);//добавить заголовок к окну
		win.appendChild(cont);

		//обавить к окну атрибутов стрелки
		var arrow1 = document.createElement('div');
		arrow1.className = 'arrow-up-left';
		arrow1.id='arrow4';
		win.appendChild(arrow1);
		var arrow2 = document.createElement('div');
		arrow2.className = 'arrow-up-right';
		arrow2.id='arrow3';
		win.appendChild(arrow2);
		var arrow3 = document.createElement('div');
		arrow3.className = 'arrow-down-left';
		arrow3.id='arrow2';
		win.appendChild(arrow3);
		var arrow4 = document.createElement('div');
		arrow4.className = 'arrow-down-right';
		arrow4.id='arrow1';
		win.appendChild(arrow4);

		document.body.appendChild(win);//добавить окно к документу
		}//create()
	
	//-------------------------------------------------создать окно прогнозных ресурсов-----------------------------------
	function view_pr(){
		if (document.getElementById('win_pr')){//если окно создано  не создавать окно повторно
			return;
			}
		var win_pr = document.createElement('div');//создание слоя окна
		win_pr.className = 'win_pr';//стиль общего окна
		win_pr.id = 'win_pr';
		win_pr.style.left = '100px';
		win_pr.style.top = '100px';

		var title_pr = document.createElement('div');//создание слоя заголовка
		title_pr.className = 'title_pr';//стиль заголовка
		title_pr.innerHTML = "<div style='position:absolute;margin-top:4px;margin-left:5px;'><span style='color:#fff;font-weight: bolder;font-family: Arial;font-size: 110%;'>Прогнозные ресурсы</span></div>";//текст заголовка

		var div_name = document.createElement('div'); //слой для отображения названия прогнозного объекта 
		div_name.className = "div_name";
		div_name.innerHTML = '<span id="name-object">'+name_object+'</span>';//добавить название прогнозного объекта
		
		var div_cont = document.createElement('div'); //слой для отображения таблицы прогнозных ресурсов
		div_cont.className = "div_cont";

		var table_pr = document.createElement('table');//создать таблицу прогнозных ресурсов
		table_pr.id="table_pr";
		table_pr.className = 'table_style';
		var tbody = document.createElement('tbody');//создать тело таблицы
		
		var tr1 = document.createElement('tr');//первая строка таблицы
		tr1.id="tr1";tr1.height="50px";tr1.align="center";tr1.className="tr_style";
		var td1_1 = document.createElement('td');td1_1.className="td_style";//создать ячейки первого столбца
		var td1_2 = document.createElement('td');td1_2.className="td_style";
		var td1_3 = document.createElement('td');td1_3.className="td_style";
		var td1_4 = document.createElement('td');td1_4.className="td_style";
		td1_1.innerHTML = '<span style="font-weight: bold;">категория</span>';
		td1_2.innerHTML = '<span style="font-weight: bold;">коренные</span>';
		td1_3.innerHTML = '<span style="font-weight: bold;">россыпные</span>';
		td1_4.innerHTML = '<span style="font-weight: bold;">всего (млн.карат)</span>';
		tr1.appendChild(td1_1);tr1.appendChild(td1_2);tr1.appendChild(td1_3);tr1.appendChild(td1_4);
		tbody.appendChild(tr1); //добавить строку к телу таблицы

		var tr2 = document.createElement('tr');//вторая строка таблицы
		tr2.id="tr2";tr2.height="50px";tr2.align="center";tr2.className="tr_style";
		var td2_1 = document.createElement('td');td2_1.className="td_style";//создать ячейки второго столбца
		var td2_2 = document.createElement('td');td2_2.className="td_style";
		var td2_3 = document.createElement('td');td2_3.className="td_style";
		var td2_4 = document.createElement('td');td2_4.className="td_style";
		td2_1.innerHTML = '<span style="font-weight: bold;">p<sub>1</sub></span>';
		td2_2.innerHTML = '<span id="pk1">'+pk1+'</span>'; 
		td2_3.innerHTML = '<span id="pr1">'+pr1+'</span>'; 
		td2_4.innerHTML = '<span id="p1_all">'+p1_all+'</span>'; //сумма по категории p1
		tr2.appendChild(td2_1);tr2.appendChild(td2_2);tr2.appendChild(td2_3);tr2.appendChild(td2_4);
		tbody.appendChild(tr2);//добавить строку к телу таблицы

		var tr3 = document.createElement('tr');//третья строка таблицы
		tr3.id="tr3";tr3.height="50px";tr3.align="center";tr3.className="tr_style";
		var td3_1 = document.createElement('td');td3_1.className="td_style";//создать ячейки третьего столбца
		var td3_2 = document.createElement('td');td3_2.className="td_style";
		var td3_3 = document.createElement('td');td3_3.className="td_style";
		var td3_4 = document.createElement('td');td3_4.className="td_style";
		td3_1.innerHTML = '<span style="font-weight: bold;">p<sub>2</sub></span>';
		td3_2.innerHTML = '<span id="pk2">'+pk2+'</span>';
		td3_3.innerHTML = '<span id="pr2">'+pr2+'</span>';
		td3_4.innerHTML = '<span id="p2_all">'+p2_all+'</span>';//сумма по категории p2
		tr3.appendChild(td3_1);tr3.appendChild(td3_2);tr3.appendChild(td3_3);tr3.appendChild(td3_4);
		tbody.appendChild(tr3);//добавить строку к телу таблицы

		var tr4 = document.createElement('tr');//четвертая строка таблицы
		tr4.id="tr4";tr4.height="50px";tr4.align="center";tr4.className="tr_style";
		var td4_1 = document.createElement('td');td4_1.className="td_style";//создать ячейки четвертого столбца
		var td4_2 = document.createElement('td');td4_2.className="td_style";
		var td4_3 = document.createElement('td');td4_3.className="td_style";
		var td4_4 = document.createElement('td');td4_4.className="td_style";
		td4_1.innerHTML = '<span style="font-weight: bold;">p<sub>3</sub></span>';
		td4_2.innerHTML = '<span id="pk3">'+pk3+'</span>';
		td4_3.innerHTML = '<span id="pr3">'+pr3+'</span>';
		td4_4.innerHTML = '<span id="p3_all">'+p3_all+'</span>';//сумма по категории p3
		tr4.appendChild(td4_1);tr4.appendChild(td4_2);tr4.appendChild(td4_3);tr4.appendChild(td4_4);
		tbody.appendChild(tr4);//добавить строку к телу таблицы

		var tr5 = document.createElement('tr');//пятая строка таблицы
		tr5.id="tr5";tr5.height="50px";tr5.align="center";tr5.className="tr_style_sum";
		var td5_1 = document.createElement('td');td5_1.className="td_style";//создать ячейки пятого столбца
		var td5_2 = document.createElement('td');td5_2.className="td_style";
		var td5_3 = document.createElement('td');td5_3.className="td_style";
		var td5_4 = document.createElement('td');td5_4.className="td_style";
		td5_1.innerHTML = '<span style="font-weight: bold;">итого по объекту</span>';
		td5_2.innerHTML = '<span id="pk_all">'+pk_all+'</span>';
		td5_3.innerHTML = '<span id="pr_all">'+pr_all+'</span>';
		td5_4.innerHTML = '<span id="p_all">'+p_all+'</span>';//общая сумма ресурсов
		tr5.appendChild(td5_1);tr5.appendChild(td5_2);tr5.appendChild(td5_3);tr5.appendChild(td5_4);
		tbody.appendChild(tr5);//добавить строку к телу таблицы
		
		table_pr.appendChild(tbody);//добавить тело таблицы к таблице
		
		//создать события для "шапки" окна таблицы прогнозных ресурсов
		title_pr.onmousedown = function(event){//нажатие курсора на "шапке" окна
			event_pr = event || window.event;
			drag_pr=1;
			curs_pr=1;
			x2_pr=event_pr.clientX;
			y2_pr = event_pr.clientY;
			};
		title_pr.onmousemove = function(event){//перемещение окна
			event_pr = event || window.event;
			if (drag_pr==1){//если кнопка мыши нажата
				if(curs_pr==1){//присвоить курсору символ перемещения - один раз при начале перемещения окна
					document.body.style.cursor = 'all-scroll';
					curs_pr=0;
					}
				x1_pr=event_pr.clientX;    // определяем текущую позицию курсора по Х
				y1_pr=event_pr.clientY;    // определяем текущую позицию курсора по Y
				shift_x_pr=x1_pr-x2_pr;                 // вычисляем разницу (сдвиг)
				shift_y_pr=y1_pr-y2_pr; 
				win_pr.style.left = win_pr.offsetLeft+shift_x_pr+'px';
				win_pr.style.top = win_pr.offsetTop+shift_y_pr+'px';
				x2_pr=x1_pr; y2_pr=y1_pr; // запоминаем предыдущие координаты курсора
				}
			};
		title_pr.onmouseup = function(){
			drag_pr=0;
			document.body.style.cursor = 'default';
			};
		var close_pr = document.createElement('div');
		close_pr.className = 'close_pr';
		var image_pr = document.createElement('img');//изображение для закрытия окна
		image_pr.src="images/window/close.png";
		image_pr.onclick = function(event) {
			document.body.removeChild(win_pr); //удалить окно
			};
		image_pr.onmousemove = function(event){ //при событии перемещения окна - отменить перемещение окна(когда указатель находится над изображением)  
			drag_pr=0;
			};
		close_pr.appendChild(image_pr);

		title_pr.appendChild(close_pr);//добавить слой с изображением для закрытия окна к слою заголовка
		div_cont.appendChild(table_pr);//добавить таблицу прогнозных ресурсов к соответствующему слою
		
		win_pr.appendChild(title_pr);//добавить заголовок к общему окну
		win_pr.appendChild(div_name);//добавить слой названия прогнозного объекта к общему окну
		win_pr.appendChild(div_cont);//добавить слой таблицы прогнозных ресурсов к общему окну
		document.body.appendChild(win_pr);//добавить окно к документу
		}//view_pr()

		
	//--------------------------------------------функции событий для окна выбора сервисов------------------------------
    function visible_sr(el){
        if(el.style.visibility=='visible'){ 
 			el.style.visibility = 'hidden';//скрыть панель
            }
        else{
     	   el.style.visibility = 'visible';//показать панель
        	}
    	}

	function close_sr_move(){//при попытке перемещать окно когда курсор находится над изображением закрытия окна - не перемещать окно
		document.body.style.cursor = 'default';//стандартный стиль курсора
		drag_sr=0;//не перемещать окно
		}
	
    function move(el,event){ //если нажата мышь, разрешить перемещение
    	curs_sr=1;
		drag_sr=1;
		x2_sr=event.clientX;
		y2_sr = event.clientY;
        }

    function drag_fun(el,event){//перемещать окно
    	if (drag_sr==1){ //при нажатой кнопки курсора на заголовке - перемещать окно
    		if(curs_sr==1){//присвоить курсору символ перемещения - один раз при начале перемещения окна
				document.body.style.cursor = 'all-scroll';
				curs_sr=0;
				}
    		x1_sr=event.clientX;    // определяем текущую позицию курсора по Х
    		y1_sr=event.clientY;    // определяем текущую позицию курсора по Y
    		shift_x=x1_sr-x2_sr;                 // вычисляем разницу (сдвиг)
    		shift_y=y1_sr-y2_sr; 
			el.style.left = el.offsetLeft+shift_x+'px';
			el.style.top = el.offsetTop+shift_y+'px';
			x2_sr=x1_sr; y2_sr=y1_sr; // запоминаем предыдущие координаты курсора
    		}
        }

    function stop_dragging(){//остановить перемещение
        drag_sr=0;
        document.body.style.cursor = 'default';
        }

    function loadfile(){//функция для загрузки сервлета(для скачивания файла)
		//location.href='/load.java'; //использовать на сервере
		location.href = '/mpr/load.java';//использовать в проекте
		}
	function loadtable(){
		location.href = '/mpr/load_table1.java';
		}
	function loadtable2(){
		location.href = '/mpr/load_table2.java';
		}
	function loadtext(){
		location.href = '/mpr/load_text.java';
		}
    </script>

  </head>

  <f:view>
    <f:loadBundle basename="res.mapviewer" var="res"/>
    
    <a:context value="#{mapContext}" />
    
    <body class="soria" onload="init();" onClick="click1(event);">
      <h:form id="mapForm" style="height: 100%; width: 100%;">
      
   		<div id="div1">
			<div id="title" onMouseDown="move(document.getElementById('div1'),event);" onMouseMove="drag_fun(document.getElementById('div1'),event);" onmouseup="stop_dragging();">
				<div id="text_title">
					<span>Выбор прогнозной карты</span>
				</div>
				<div id="close">
					<img src="images/window/close.png" onClick="visible_sr(document.getElementById('div1'));" onMouseMove="close_sr_move();"/>
				</div>
			</div>
			<div id="select_map_text">
				<span style="font-family:Arial;font-size:120%;">Список прогнозных карт:</span>	
			</div>
			<div id="select_map">
				<h:selectOneListbox value="#{resource.rayon}" style="width:350px;" size="7">
					<f:selectItems value="#{resource.rayons}"/>
				</h:selectOneListbox>
			</div>
			<div id="select_map_button" onClick="visible_sr(document.getElementById('div1'));"> 
				<h:commandButton value="Загрузить" action="#{resource.selectGeoMap}"/>
			</div>
		</div>
      
      
      <div id="search_div">
      		<div id="title_s" onMouseDown="move(document.getElementById('search_div'),event);" onMouseMove="drag_fun(document.getElementById('search_div'),event);" onmouseup="stop_dragging();">
				<div id="text_title_s">
					<span>Поиск объекта</span>
				</div>
				<div id="close">
					<img src="images/window/close.png" onClick="visible_sr(document.getElementById('search_div'));" onMouseMove="close_sr_move();"/>
				</div>
				<div id="close_s">
					<img src="images/window/close.png" onClick="visible_sr(document.getElementById('search_div'));" onMouseMove="close_sr_move();"/>
				</div>
			</div>
			<div id="text1_s">
				<span>Название объекта:</span>
			</div>
			<div id="name_s">
			<h:inputText value="#{search.obj}" style="width:250px;height:20px;" />
			</div>
			<div id="text2_s">
				<span>Место поиска:</span>
			</div>
			<div id="place_s">
			<h:selectOneMenu value="#{search.lay}">
				<f:selectItems value="#{search.layers}"/>
			</h:selectOneMenu>
			</div>	
			<div id="enter_s">
				<h:commandButton value="Найти объект" action="#{search.selectObj}"/>
			</div>
      </div>
            
        <div id="layoutContainer">
          
        </div>
        
        <div id="content">
          <span id="titleText" style="color:white;font-size:120%;">Мониторинг прогнозных ресурсов алмазов</span>
         
        
          <div id="linksPane">
            <table align="right" cellspacing="2" border="0">
            
                <tr>     
                <td colspan="2">
                	<div style="text-align:center;width:420px;overflow:auto;">
					<span id="name-rayon" style="color:#121212;font-family:Arial;font-size:105%;font-weight:bold;"></span>
                	</div>
                </td> 
            

               	<td>
                  	<div style="color:#121212; font-family: Arial;font-weight:bold;font-size: 105%;width:340px;text-align: center;">
                  		<h:outputText value="Оценка прогнозных ресурсов на: #{period.date} г." />
                  	</div>
                </td>
                <td align="right" rowspan="2">
                    <a class="appLink" href="help/index.html" target="_blank">Справка</a>
                </td>
                </tr>
                <tr>
      			
      			 <td>
                	<div style="text-align:right;">
              		<button type="button" value="button" id="but_view_pr" disabled="true" onclick="view_pr();">Прогнозные ресурсы объекта</button>
                	</div>
                </td>
                <td>
                	<div style="text-align:left;">
                  	<button type="button" value="button" id="but_view_all" disabled="true" onclick="loadfile();">Описание объекта</button>
                	</div>
                </td>      
                
      			
                  <td align="center">
                  	<h:selectOneMenu value="#{period.date}">
						<f:selectItems value="#{period.dates}"/>
			  		</h:selectOneMenu>
			  		<h:commandButton value="Установить дату" action="#{period.selectDate}"/>
                  </td>
  
                </tr>
              </table> 
          </div> 
     
          <!-- 
              Custom content to place in a dijit.TitlePane should be placed here in a div whose class attribute is "sideContent".
              The title attribute for this node will be used as the title.  If a resource string wma.Res.getString("<title attribute value>")
              exists, the corresponding value will be used first.
              
              For Example:              
              <div class="sideContent" title="Content Title String">
                <h1>Custom Side Content</h1>
              </div>
          -->
          
          <!-- Map Control Content -->
          <a:map value="#{mapContext.webMap}" id="map1" width="#{param.width}" height="#{param.height}" scaleBar="#{mapContext.attributes['webappScaleBar']}" />
<div id="northarrow">
	<h:inputHidden id="northarrowHid" value="#{mapContext.attributes.webappNorthArrow.imageUrl}" />
</div>

          
          <!-- Map TOC Content -->
          <a:toc id="toc1" value="#{mapContext.webToc}" mapId="map1" clientPostBack="true" />
          
          <!-- Task Results TOC Content -->
          <a:results id="results" value="#{mapContext.attributes.webappResults}" mapId="map1" clientPostBack="true" xslFile="results.xsl" />
  
          <!-- Map Overview Content -->
          <a:overview id="ov1" value="#{mapContext.webOverview}" mapId="map1" width="200" height="150" lineColor="#F00" />
          
          <!-- Map Tools Content -->
          <a:task id="mapToolsTask"
                  value="#{mapContext.attributes.webappMapToolsTask}"
                  taskInfo="#{mapContext.attributes.webappMapToolsTask.taskInfo}"
                  mapId="map1" 
                  windowingSupport="false"
                  style="padding:0px;margin:0px;" 
                  xslFile="maptoolstask.xsl" />
          <input id="overviewToggleButton" width="25px" type="image" height="25px" 
                 title="Toggle Overview Map"
                 onclick="wma.toggleOverview(this); return false;"
                 onload="adf.Utils.onHandleImage(this, 'images/hide-overview-map.png');"
                 src="images/hide-overview-map.png" />
            
          <!--  Application Tasks Content -->
          <div id="task-menu" class="tasks-menu">
            <ul>      
            <li class="menu-bar">
               
				<a:toolbar id="toolbar2" toolbarStyle="TEXTONLY" mapId="map1" activeTool="SelectRayon">
					<a:tool id="SelectRayon" toolTip="Выбрать район для перехода к карте" clientAction="adf.MapPoint" serverAction="adf.mpr.tools.SelectRayon" toolText="Выбрать район"/>
					<a:command id="ChangeResource"  toolTip="Перейти к карте выбранного района" action="#{ChangeResource.addAgsSource}" toolText="Перейти к карте"/>
					<a:command id="Rayons" toolTip="Вернуться к схеме районов" action="#{ChangeResource.defaultRayons}" toolText="Схема районов"/>	
					<a:tool id="SelectObject" toolTip="Выбрать картографический объект" clientAction="adf.MapPoint" serverAction="adf.mpr.tools.SelectObject" toolText="Выбрать объект"/> 		
									 	
				</a:toolbar>
			 
              </li>
           
    		  <li class="menu-bar">
			  <a href="#" class="menu-header" onClick="visible_sr(document.getElementById('div1'));">
              <span>Открыть</span>
              </a>		 	
              </li>
	
			  <li class="menu-bar">
			  <a href="#" class="menu-header" onClick="visible_sr(document.getElementById('search_div'));">
              <span>Поиск</span>
              </a>
			  </li>
			  <li class="menu-bar">
			  <a href="#" class="menu-header" onClick="loadtable();">
              <span>Сводная таблица</span>
              </a>
			  </li>
			  <li class="menu-bar">
			  <a href="#" class="menu-header" onClick="loadtext();">
              <span>Аналитическая записка</span>
              </a>
			  </li>
			  
            </ul>
          </div>

          <a:task id="searchAttributesTask" value="#{mapContext.attributes.webappSearchAttributesTask}" taskInfo="#{mapContext.attributes.webappSearchAttributesTask.taskInfo}" mapId="map1" />

          <h:inputHidden id="taskWindows"/>
        </div>
      </h:form>
    </body>
  </f:view>
</html>
