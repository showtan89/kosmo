<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="X-Content-Type-Options" content="nosniff" />
<title>Helper - Conversion Calculator</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
</head>
<body>

<jsp:include page="../../setting/header01.jsp" flush="false" />

<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<div class="breadcrumb-area">
	<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(resources/img/bg-img/image5.jpg);">
		<h2>Conversion Calculator</h2>
	</div> <br><br>
</div>

<script type="text/javascript">
	
	function convertChange(conv, target, result) {
		
		var value = conv.options[conv.selectedIndex].value;
		var targeted = document.getElementById(target);
		var result = document.getElementById(result);
		
		removeAll(targeted);
		removeAll(result);
		
		if (value == 'length') {
			addOption('Meter', targeted);
			addOption('Centimeter', targeted);
			addOption('Mile', targeted);
			addOption('Yard', targeted);
			addOption('Inch', targeted);
			addOption('Feet', targeted);
			
			addOption('Meter', result);
			addOption('Centimeter', result);
			addOption('Mile', result);
			addOption('Yard', result);
			addOption('Inch', result);
			addOption('Feet', result);
			
		} else if (value == 'volume') {
			addOption('Milliliter', targeted);
			addOption('Liter', targeted);
			addOption('Gallon', targeted);
			addOption('Cup', targeted);
			
			addOption('Milliliter', result);
			addOption('Liter', result);
			addOption('Gallon', result);
			addOption('Cup', result);
			
		} else if (value == 'speed') {
			addOption('Meter per second', targeted);
			addOption('Knot', targeted);
			addOption('Mile per hour', targeted);
			
			addOption('Meter per second', result);
			addOption('Knot', result);
			addOption('Mile per hour', result);
			
		} else if (value == 'temp') {
			addOption('Regulator', targeted);
			addOption('Fahrenheit', targeted);
			addOption('Kelvin', targeted);
			
			addOption('Regulator', result);
			addOption('Fahrenheit', result);
			addOption('Kelvin', result);
			
		} else if (value == 'mass') {
			addOption('Milligram', targeted);
			addOption('Gram', targeted);
			addOption('Kilogram', targeted);
			addOption('Pound', targeted);
			addOption('Ounce', targeted);
			
			addOption('Milligram', result);
			addOption('Gram', result);
			addOption('Kilogram', result);
			addOption('Pound', result);
			addOption('Ounce', result);
			
		}
		
	}
	
	function addOption(value, e) {
	    var o = new Option(value);
	    
	    try {
	        e.add(o);
	    } catch(ee){
	        e.add(o, null);
	    }
	}

	function removeAll(e) {
	   e.options.length=0;
	}
	
	
	
</script>

<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
			/* keyup ================================================================================== */
			$('#baseInput').keyup(function(){
				
				var baseInput = $('#baseInput').val();
				var baseType = $('#baseType').val();
				var resultType = $('#resultType').val();
				var convert = $('#convert').val();
				
				/* 길이 ============================================================ */
				if (convert == 'length') {
					if (baseType == 'Meter') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 100).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 1609.344).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1.094).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 3.281).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 39.37).toFixed(8)));
						}
						
					} else if (baseType == 'Centimeter') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 100).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 160934.4).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 91.44).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput / 30.48).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput / 2.54).toFixed(8)));
						}
						
					} else if (baseType == 'Mile') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput * 1609.344).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 160934.4).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1760).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 5280).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 63360).toFixed(8)));
						}
						
					} else if (baseType == 'Yard') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 1.094).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 91.44).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 1760).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 3).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 36).toFixed(8)));
						}
						
					} else if (baseType == 'Feet') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 3.281).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 30.48).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 5280).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 3).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 12).toFixed(8)));
						}
						
					} else if (baseType == 'Inch') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 39.37).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 2.54).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 63360).toFixed(10)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 36).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput / 12).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
	
					}
					
				/* 부피 ======================================================================== */
				} else if (convert == 'volume') {
					if (baseType == 'Milliliter') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 3785.412).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput / 240).toFixed(8)));
						}
						
					} else if (baseType == 'Liter') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 3.785).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput * 4.167).toFixed(8)));
						}
						
					} else if (baseType == 'Cup') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 240).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput / 4.167).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 15.773).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
				
				/* 속도 ======================================================================= */
				} else if (convert == 'speed') {
					if (baseType == 'Meter per second') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput * 1.944).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 2.237).toFixed(8)));
						}
						
					} else if (baseType == 'Knot') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput / 1.944).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 1.151).toFixed(8)));
						}
						
					} else if (baseType == 'Mile per hour') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput / 2.237).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput / 1.151).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
					
				/* 온도 =========================================================== */	
				} else if (convert == 'temp') {
					if (baseType == 'Regulator') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val(parseFloat((baseInput * (9/5) + 32).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat((baseInput + 273.15).toFixed(8)));
						}
						
					} else if (baseType == 'Fahrenheit') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat(((baseInput - 32) * (5/9)).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat(((baseInput - 32) * (5/9) + 273.15).toFixed(8)));
						}
						
					} else if (baseType == 'Kelvin') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat((baseInput - 273.15).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val( parseFloat( ( (baseInput - 273.15) * (9/5) + 32).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
					
				/* 질량 ========================================================= */
				} else if (convert == 'mass') {
					if (baseType == 'Milligram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 1000000).toFixed(10)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 453592.37).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput / 28349.523).toFixed(10)));
						}
						
					}  else if (baseType == 'Gram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 453.592).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput / 28.35).toFixed(8)));
						}
						
					} else if (baseType == 'Kilogram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1000000).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput * 2.205).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 35.274).toFixed(10)));
						}
						
					} else if (baseType == 'Pound') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 453592.37).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 453.592).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 2.205).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 16).toFixed(8)));
						}
						
					} else if (baseType == 'Ounce') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 28349.523).toFixed(10)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 28.35).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 35.274).toFixed(10)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 16).toFixed(8)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
					}
				}
			})
			
			
			/* baseType Change ================================================================ */
			$('#baseType').change(function(){
				
				var baseInput = $('#baseInput').val();
				var baseType = $('#baseType').val();
				var resultType = $('#resultType').val();
				var convert = $('#convert').val();
				
				/* 길이 ============================================================ */
				if (convert == 'length') {
					if (baseType == 'Meter') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 100).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 1609.344).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1.094).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 3.281).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 39.37).toFixed(8)));
						}
						
					} else if (baseType == 'Centimeter') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 100).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 160934.4).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 91.44).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput / 30.48).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput / 2.54).toFixed(8)));
						}
						
					} else if (baseType == 'Mile') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput * 1609.344).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 160934.4).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1760).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 5280).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 63360).toFixed(8)));
						}
						
					} else if (baseType == 'Yard') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 1.094).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 91.44).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 1760).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 3).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 36).toFixed(8)));
						}
						
					} else if (baseType == 'Feet') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 3.281).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 30.48).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 5280).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 3).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 12).toFixed(8)));
						}
						
					} else if (baseType == 'Inch') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 39.37).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 2.54).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 63360).toFixed(10)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 36).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput / 12).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
	
					}
					
				/* 부피 ======================================================================== */
				} else if (convert == 'volume') {
					if (baseType == 'Milliliter') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 3785.412).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput / 240).toFixed(8)));
						}
						
					} else if (baseType == 'Liter') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 3.785).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput * 4.167).toFixed(8)));
						}
						
					} else if (baseType == 'Cup') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 240).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput / 4.167).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 15.773).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
				
				/* 속도 ======================================================================= */
				} else if (convert == 'speed') {
					if (baseType == 'Meter per second') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput * 1.944).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 2.237).toFixed(8)));
						}
						
					} else if (baseType == 'Knot') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput / 1.944).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 1.151).toFixed(8)));
						}
						
					} else if (baseType == 'Mile per hour') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput / 2.237).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput / 1.151).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
					
				/* 온도 =========================================================== */	
				} else if (convert == 'temp') {
					if (baseType == 'Regulator') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val(parseFloat((baseInput * (9/5) + 32).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat((baseInput + 273.15).toFixed(8)));
						}
						
					} else if (baseType == 'Fahrenheit') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat(((baseInput - 32) * (5/9)).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat(((baseInput - 32) * (5/9) + 273.15).toFixed(8)));
						}
						
					} else if (baseType == 'Kelvin') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat((baseInput - 273.15).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val( parseFloat( ( (baseInput - 273.15) * (9/5) + 32).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
					
				/* 질량 ========================================================= */
				} else if (convert == 'mass') {
					if (baseType == 'Milligram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 1000000).toFixed(10)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 453592.37).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput / 28349.523).toFixed(10)));
						}
						
					}  else if (baseType == 'Gram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 453.592).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput / 28.35).toFixed(8)));
						}
						
					} else if (baseType == 'Kilogram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1000000).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput * 2.205).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 35.274).toFixed(10)));
						}
						
					} else if (baseType == 'Pound') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 453592.37).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 453.592).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 2.205).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 16).toFixed(8)));
						}
						
					} else if (baseType == 'Ounce') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 28349.523).toFixed(10)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 28.35).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 35.274).toFixed(10)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 16).toFixed(8)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
					}
				}
			})
			
			
			/* resultType Change ================================================================ */
			$('#resultType').change(function(){
				
				var baseInput = $('#baseInput').val();
				var baseType = $('#baseType').val();
				var resultType = $('#resultType').val();
				var convert = $('#convert').val();
				
				/* 길이 ============================================================ */
				if (convert == 'length') {
					if (baseType == 'Meter') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 100).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 1609.344).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1.094).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 3.281).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 39.37).toFixed(8)));
						}
						
					} else if (baseType == 'Centimeter') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 100).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 160934.4).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 91.44).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput / 30.48).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput / 2.54).toFixed(8)));
						}
						
					} else if (baseType == 'Mile') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput * 1609.344).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 160934.4).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1760).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 5280).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 63360).toFixed(8)));
						}
						
					} else if (baseType == 'Yard') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 1.094).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 91.44).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 1760).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 3).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 36).toFixed(8)));
						}
						
					} else if (baseType == 'Feet') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 3.281).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 30.48).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 5280).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 3).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 12).toFixed(8)));
						}
						
					} else if (baseType == 'Inch') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 39.37).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 2.54).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 63360).toFixed(10)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 36).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput / 12).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
	
					}
					
				/* 부피 ======================================================================== */
				} else if (convert == 'volume') {
					if (baseType == 'Milliliter') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 3785.412).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput / 240).toFixed(8)));
						}
						
					} else if (baseType == 'Liter') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 3.785).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput * 4.167).toFixed(8)));
						}
						
					} else if (baseType == 'Cup') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 240).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput / 4.167).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 15.773).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
				
				/* 속도 ======================================================================= */
				} else if (convert == 'speed') {
					if (baseType == 'Meter per second') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput * 1.944).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 2.237).toFixed(8)));
						}
						
					} else if (baseType == 'Knot') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput / 1.944).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 1.151).toFixed(8)));
						}
						
					} else if (baseType == 'Mile per hour') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput / 2.237).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput / 1.151).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
					
				/* 온도 =========================================================== */	
				} else if (convert == 'temp') {
					if (baseType == 'Regulator') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val(parseFloat((baseInput * (9/5) + 32).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat((baseInput + 273.15).toFixed(8)));
						}
						
					} else if (baseType == 'Fahrenheit') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat(((baseInput - 32) * (5/9)).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat(((baseInput - 32) * (5/9) + 273.15).toFixed(8)));
						}
						
					} else if (baseType == 'Kelvin') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat((baseInput - 273.15).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val( parseFloat( ( (baseInput - 273.15) * (9/5) + 32).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
					
				/* 질량 ========================================================= */
				} else if (convert == 'mass') {
					if (baseType == 'Milligram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 1000000).toFixed(10)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 453592.37).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput / 28349.523).toFixed(10)));
						}
						
					}  else if (baseType == 'Gram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 453.592).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput / 28.35).toFixed(8)));
						}
						
					} else if (baseType == 'Kilogram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1000000).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput * 2.205).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 35.274).toFixed(10)));
						}
						
					} else if (baseType == 'Pound') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 453592.37).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 453.592).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 2.205).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 16).toFixed(8)));
						}
						
					} else if (baseType == 'Ounce') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 28349.523).toFixed(10)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 28.35).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 35.274).toFixed(10)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 16).toFixed(8)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
					}
				}
			})
			
			
			/* convert Change ================================================================ */
			$('#convert').change(function(){
				
				var baseInput = $('#baseInput').val();
				var baseType = $('#baseType').val();
				var resultType = $('#resultType').val();
				var convert = $('#convert').val();
				
				/* 길이 ============================================================ */
				if (convert == 'length') {
					if (baseType == 'Meter') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 100).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 1609.344).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1.094).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 3.281).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 39.37).toFixed(8)));
						}
						
					} else if (baseType == 'Centimeter') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 100).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 160934.4).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 91.44).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput / 30.48).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput / 2.54).toFixed(8)));
						}
						
					} else if (baseType == 'Mile') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput * 1609.344).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 160934.4).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat(baseInput * 1));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1760).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 5280).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 63360).toFixed(8)));
						}
						
					} else if (baseType == 'Yard') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 1.094).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 91.44).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 1760).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 3).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 36).toFixed(8)));
						}
						
					} else if (baseType == 'Feet') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 3.281).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 30.48).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 5280).toFixed(8)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 3).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 12).toFixed(8)));
						}
						
					} else if (baseType == 'Inch') {
						if (resultType == 'Meter') {
							$('#resultInput').val(parseFloat((baseInput / 39.37).toFixed(8)));
						} else if (resultType == 'Centimeter') {
							$('#resultInput').val(parseFloat((baseInput * 2.54).toFixed(8)));
						} else if (resultType == 'Mile') {
							$('#resultInput').val(parseFloat((baseInput / 63360).toFixed(10)));
						} else if (resultType == 'Yard') {
							$('#resultInput').val(parseFloat((baseInput / 36).toFixed(8)));
						} else if (resultType == 'Feet') {
							$('#resultInput').val(parseFloat((baseInput / 12).toFixed(8)));
						} else if (resultType == 'Inch') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
	
					}
					
				/* 부피 ======================================================================== */
				} else if (convert == 'volume') {
					if (baseType == 'Milliliter') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 3785.412).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput / 240).toFixed(8)));
						}
						
					} else if (baseType == 'Liter') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 3.785).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput * 4.167).toFixed(8)));
						}
						
					} else if (baseType == 'Cup') {
						if (resultType == 'Milliliter') {
							$('#resultInput').val(parseFloat((baseInput * 240).toFixed(8)));
						} else if (resultType == 'Liter') {
							$('#resultInput').val(parseFloat((baseInput / 4.167).toFixed(8)));
						} else if (resultType == 'Gallon') {
							$('#resultInput').val(parseFloat((baseInput / 15.773).toFixed(8)));
						} else if (resultType == 'Cup') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
				
				/* 속도 ======================================================================= */
				} else if (convert == 'speed') {
					if (baseType == 'Meter per second') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput * 1.944).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 2.237).toFixed(8)));
						}
						
					} else if (baseType == 'Knot') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput / 1.944).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 1.151).toFixed(8)));
						}
						
					} else if (baseType == 'Mile per hour') {
						if (resultType == 'Meter per second') {
							$('#resultInput').val(parseFloat((baseInput / 2.237).toFixed(8)));
						} else if (resultType == 'Knot') {
							$('#resultInput').val(parseFloat((baseInput / 1.151).toFixed(8)));
						} else if (resultType == 'Mile per hour') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
					
				/* 온도 =========================================================== */	
				} else if (convert == 'temp') {
					if (baseType == 'Regulator') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val(parseFloat((baseInput * (9/5) + 32).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat((baseInput + 273.15).toFixed(8)));
						}
						
					} else if (baseType == 'Fahrenheit') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat(((baseInput - 32) * (5/9)).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat(((baseInput - 32) * (5/9) + 273.15).toFixed(8)));
						}
						
					} else if (baseType == 'Kelvin') {
						if (resultType == 'Regulator') {
							$('#resultInput').val(parseFloat((baseInput - 273.15).toFixed(8)));
						} else if (resultType == 'Fahrenheit') {
							$('#resultInput').val( parseFloat( ( (baseInput - 273.15) * (9/5) + 32).toFixed(8)));
						} else if (resultType == 'Kelvin') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
						
					}
					
				/* 질량 ========================================================= */
				} else if (convert == 'mass') {
					if (baseType == 'Milligram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 1000000).toFixed(10)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 453592.37).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput / 28349.523).toFixed(10)));
						}
						
					}  else if (baseType == 'Gram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 1000).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 453.592).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput / 28.35).toFixed(8)));
						}
						
					} else if (baseType == 'Kilogram') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 1000000).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 1000).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput * 2.205).toFixed(10)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 35.274).toFixed(10)));
						}
						
					} else if (baseType == 'Pound') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 453592.37).toFixed(8)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 453.592).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 2.205).toFixed(8)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 16).toFixed(8)));
						}
						
					} else if (baseType == 'Ounce') {
						if (resultType == 'Milligram') {
							$('#resultInput').val(parseFloat((baseInput * 28349.523).toFixed(10)));
						} else if (resultType == 'Gram') {
							$('#resultInput').val(parseFloat((baseInput * 28.35).toFixed(8)));
						} else if (resultType == 'Kilogram') {
							$('#resultInput').val(parseFloat((baseInput / 35.274).toFixed(10)));
						} else if (resultType == 'Pound') {
							$('#resultInput').val(parseFloat((baseInput / 16).toFixed(8)));
						} else if (resultType == 'Ounce') {
							$('#resultInput').val(parseFloat((baseInput * 1).toFixed(8)));
						}
					}
				}
			})
			
			$("input:text[numberOnly]").on("focus", function() {
			    var x = $(this).val();
			    x = removeCommas(x);
			    $(this).val(x);
			}).on("focusout", function() {
			    var x = $(this).val();
			    if(x && x.length > 0) {
			        if(!$.isNumeric(x)) {
			            x = x.replace(/[^0-9\\.]/g,"");
			        }
			        x = addCommas(x);
			        $(this).val(x);
			    }
			}).on("keyup", function() {
			    $(this).val($(this).val().replace(/[^0-9\\.]/g,""));
			});
			
		});
		
		
		
		
		//3자리 단위마다 콤마 생성
		function addCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		 
		//모든 콤마 제거
		function removeCommas(x) {
		    if(!x || x.length == 0) return "";
		    else return x.split(",").join("");
		}
	
	</script>

<div class="container" style="margin-bottom: 50px;">
	<!-- <font size="20"><b>Conversion Calculator</b></font>
	<br>-->
	<br> 
<form action="#" method="post"
	style="margin-left: auto; margin-right: auto; border: 1px solid #ced4da; padding: 30px; backgrond-color: green; border-radius: 10px;" 
		name="convertForm">

			<div class="col-md-7 mb-7" style="margin-left: auto; margin-right: auto;">
			<select class="custom-select d-block w-100" name="convert" id="convert" onChange="convertChange(this, 'baseType', 'resultType')">
				<option value="length" selected="selected">Length</option>
				<option value="volume">Volume</option>
				<option value="speed">Speed</option>
				<option value="temp">Temperature</option>
				<option value="mass">Mass</option>
			</select>
			</div>
			
			<br>
			<br>
			
			<div class="col-md-7 mb-7" style="margin-left: auto; margin-right: auto;">
			
			<div class="col-md-12 mb-12">
				<label for="baseInput">
					<font size="5"><b>I N P U T</b></font>
				</label> 
				<input type="text" name="baseInput" id="baseInput" value="0" class="form-control" maxlength="10" numberOnly>
			
			
			<select class="custom-select d-block w-100" name="baseType" id="baseType">
				<option value="Meter" selected="selected">Meter</option>
				<option value="Centimeter">Centimeter</option>
				<option value="Mile">Mile</option>
				<option value="Yard">Yard</option>
				<option value="Inch">Inch</option>
				<option value="Feet">Feet</option>
			</select>
			</div>
			
			<div align="center">
			<br>
			<img src="resources/img/util/equal.png"><br>
			<br>
			</div>
			
			<div class="col-md-12 mb-12" align="right">
				<label for="resultInput">
					<font size="5"><b>R E S U L T</b></font>
				</label> 
				<input type="text" id="resultInput" name="resultInput" disabled="disabled"
				value="0" class="form-control">
			
			
			<select class="custom-select d-block w-100" name="resultType" id="resultType">
				<option value="Meter">Meter</option>
				<option value="Centimeter" selected="selected">Centimeter</option>
				<option value="Mile">Mile</option>
				<option value="Yard">Yard</option>
				<option value="Inch">Inch</option>
				<option value="Feet">Feet</option>
			</select>
			
			</div>
			
			</div>

</form>
</div>

<jsp:include page="../../setting/footer01.jsp" flush="false" />

</body>
</html>