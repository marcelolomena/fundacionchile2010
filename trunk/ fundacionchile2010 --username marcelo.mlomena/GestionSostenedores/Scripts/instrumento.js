function llenar(objJson,codfor) {
    var contador = 1;
    var strTabla = "";
    var unavez = true;
    var largo = objJson.length;
    if (largo > 0) {

        for (var i = 0; i < largo - 1; i++) {

            if (i > 0) {
                if (objJson[i]["CODAREA"] != objJson[i - 1]["CODAREA"]) {
                    //encabezado de area y dimension
                    strTabla += "</thead></table></div>";
                    contador++;
                    strTabla += "<p class='tit_formularios'><a href='#' id='mostrar" + contador + "'>" + objJson[i]["CODAREA"] + ". " + objJson[i]["NOMAREA"] + "</a></p>";
                    strTabla += "<div id='bloque" + contador + "'>";
                    strTabla += "<table width='100%' border='0' cellpadding='0' cellspacing='0' class='tabla_formularios' summary='Liderazgo'>";
                    if (codfor == "A") {
                        strTabla += "<thead><tr><th colspan='10'>" + objJson[i]["CODAREA"] + "." + objJson[i]["CODDIM"] + " (" + objJson[i]["NOMDIM"] + ")</th></tr>";
                    } else if (codfor == "B")  {
                        strTabla += "<thead><tr><th colspan='7'>" + objJson[i]["CODAREA"] + "." + objJson[i]["CODDIM"] + " (" + objJson[i]["NOMDIM"] + ")</th></tr>";
                    }
                    if (objJson[i]["CODAREA"] != "6") {
                        if (codfor == "A") {
                            strTabla += "<tr><td>&nbsp;</td><td>&nbsp;</td><td class='center'>1</td><td class='center'>2</td><td class='center'>3</td><td class='center'>4</td><td class='center'>5</td><td class='center'>6</td><td class='center'>7</td><td class='center'>N/A</td></tr>";
                        } else if (codfor == "B") {
                            strTabla += "<tr><td>&nbsp;</td><td>&nbsp;</td><td class='center'>0</td><td class='center'>1</td><td class='center'>2</td><td class='center'>3</td><td class='center'>N/A</td></tr>";
                        }
                    }
                }
                if ((objJson[i]["CODDIM"] != objJson[i - 1]["CODDIM"]) && (objJson[i]["CODAREA"] == objJson[i - 1]["CODAREA"])) {
                    //encabezado de dimension
                    strTabla += "</table><table width='100%' border='0' cellpadding='0' cellspacing='0' class='tabla_formularios' summary='Liderazgo'><thead>";
                    if (codfor == "A") {
                        strTabla += "<tr><th colspan='10'>" + objJson[i]["CODAREA"] + "." + objJson[i]["CODDIM"] + " (" + objJson[i]["NOMDIM"] + ")</th></tr>";
                    } else if (codfor == "B"){
                        strTabla += "<tr><th colspan='7'>" + objJson[i]["CODAREA"] + "." + objJson[i]["CODDIM"] + " (" + objJson[i]["NOMDIM"] + ")</th></tr>";
                    }
                }
            } else if (i == 0) {
                //comienzo de la tabla
                strTabla += "<p class='tit_formularios'><a href='#' id='mostrar" + contador + "'>" + objJson[i]["CODAREA"] + ". " + objJson[i]["NOMAREA"] + "</a></p>";
                strTabla += "<div id='bloque" + contador + "'>";
                strTabla += "<table width='100%' border='0' cellpadding='0' cellspacing='0' class='tabla_formularios' summary='Liderazgo'>";
                if (codfor == "A") {
                    strTabla += "<thead><tr><th colspan='10'>" + objJson[i]["CODAREA"] + "." + objJson[i]["CODDIM"] + " (" + objJson[i]["NOMDIM"] + ")</th></tr></thead>";
                    strTabla += "<tr><td><strong>Nro.</strong></td><td style='border-right: none;'><strong>&Iacute;tems</strong></td><td colspan='8' class='center' style='border-left: none;'><strong>Opciones de Respuesta</strong></td></tr>";
                    strTabla += "<tr><td>&nbsp;</td><td>&nbsp;</td><td class='center'>1</td><td class='center'>2</td><td class='center'>3</td><td class='center'>4</td><td class='center'>5</td><td class='center'>6</td><td class='center'>7</td><td class='center'>N/A</td></tr>";
                } else if (codfor == "B") {
                    strTabla += "<thead><tr><th colspan='7'>" + objJson[i]["CODAREA"] + "." + objJson[i]["CODDIM"] + " (" + objJson[i]["NOMDIM"] + ")</th></tr></thead>";
                    strTabla += "<tr><td><strong>Nro.</strong></td><td style='border-right: none;'><strong>&Iacute;tems</strong></td><td colspan='5' class='center' style='border-left: none;'><strong>Opciones de Respuesta</strong></td></tr>";
                    strTabla += "<tr><td>&nbsp;</td><td>&nbsp;</td><td class='center'>0</td><td class='center'>1</td><td class='center'>2</td><td class='center'>3</td><td class='center'>N/A</td></tr>";
                }
            }

            if (objJson[i]["CODAREA"] != "6") {
                if (objJson[i]["CODAUX"] != "0") {//esta pregunta ya se respondio
                    strTabla += "<tr bgcolor='#FBF5EF'>";
                    strTabla += "<td>" + (i + 1) + "</td><td><p>" + objJson[i]["NOMPRE"] + "</p></td>";
                    if (objJson[i]["VALRES"] == "1") {
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='1' checked disabled/></td>";
                    } else {// checked
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='1' disabled/></td>";
                    }
                    if (objJson[i]["VALRES"] == "2") {
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='2' checked disabled/></td>";
                    } else {// checked
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='2' disabled/></td>";
                    }
                    if (objJson[i]["VALRES"] == "3") {
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='3' checked disabled/></td>";
                    } else {// checked
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='3' disabled/></td>";
                    }
                    if (objJson[i]["VALRES"] == "4") {
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='4' checked disabled/></td>";
                    } else {// checked
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='4' disabled/></td>";
                    }

                    if (codfor == "A") {
                        if (objJson[i]["VALRES"] == "5") {
                            strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='5' checked disabled/></td>";
                        } else {// checked
                            strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='5' disabled/></td>";
                        }
                        if (objJson[i]["VALRES"] == "6") {
                            strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='6' checked disabled/></td>";
                        } else {// checked
                            strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='6' disabled/></td>";
                        }
                        if (objJson[i]["VALRES"] == "7") {
                            strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='7' checked disabled/></td>";
                        } else {// checked
                            strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='7' disabled/></td>";
                        }
                    }
                    if (objJson[i]["VALRES"] == "0") {
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='0' checked disabled/></td>";
                    } else {// checked
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='0' disabled/></td>";
                    }
                    strTabla += "</tr>";
                } else {
                    strTabla += "<tr>";
                    strTabla += "<td>" + (i + 1) + "</td><td><p>" + objJson[i]["NOMPRE"] + "</p></td>";
                    strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='1' /></td>";
                    strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='2' /></td>";
                    strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='3' /></td>";
                    strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='4' /></td>";
                    if (codfor == "A") {
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='5' /></td>";
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='6' /></td>";
                        strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='7' /></td>";
                    }
                    strTabla += "<td width='3%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='0' /></td>";
                    strTabla += "</tr>";
                }
            } else { // mejoramiento
                if (i != largo - 2 || codfor != "A") {
                    if (unavez) {
                        strTabla += "<tr bgcolor='#FBF5EF'><td colspan='7'>";
                        strTabla += "<p>También se busca conocer su opinión en relación a los grados en que considera que la gestión del sostenedor precisa mejorar en cada una de las 6 áreas consultadas. Para ello, debe marcar en el casillero que la opción que mejor corresponda a su opinión. El significado de los números del 1 al 5 es el siguiente:</p>";
                        strTabla += "<p>1   = Necesita mejorar mucho</p>";
                        strTabla += "<p>2   = Necesita mejorar medianamente</p>";
                        strTabla += "<p>3   = Necesita mejorar muy poco</p>";
                        strTabla += "<p>4   = No requiere mejora</p>";
                        strTabla += "<p>N/S = No sabe</p>";
                        strTabla += "</td></tr>";
                        strTabla += "<tr><td><strong>Nro.</strong></td><td style='border-right: none;'><strong>&Iacute;tems</strong></td><td colspan='5' class='center' style='border-left: none;'><strong>Opciones de Respuesta</strong></td></tr>";
                        strTabla += "<tr><td>&nbsp;</td><td>&nbsp;</td><td class='center'>1</td><td class='center'>2</td><td class='center'>3</td><td class='center'>4</td><td class='center'>N/A</td></tr>";
                        unavez = false;
                    }
                    if (objJson[i]["CODAUX"] != "0") {//esta pregunta ya se respondio
                        strTabla += "<tr bgcolor='#FBF5EF'>";
                        strTabla += "<td>" + (i + 1) + "</td><td><p>" + objJson[i]["NOMPRE"] + "</p></td>";
                       
                        if (objJson[i]["VALRES"] == "1") {
                            strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='1' checked disabled/></td>";
                        } else {
                            strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='1' disabled/></td>";
                        }
                        if (objJson[i]["VALRES"] == "2") {
                            strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='2' checked disabled/></td>";
                        } else {
                            strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='2' disabled/></td>";
                        }
                        if (objJson[i]["VALRES"] == "3") {
                            strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='3' checked disabled/></td>";
                        } else {
                            strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='3' disabled/></td>";
                        }
                        if (objJson[i]["VALRES"] == "4") {
                            strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='4' checked disabled/></td>";
                        } else {
                            strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='4' disabled/></td>";
                        }
                        if (objJson[i]["VALRES"] == "5") {
                            strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='0' checked disabled/></td>";
                        } else {
                            strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='0' disabled/></td>";
                        }
                        strTabla += "</tr>";
                    } else {
                        strTabla += "<tr>";
                        strTabla += "<td>" + (i + 1) + "</td><td><p>" + objJson[i]["NOMPRE"] + "</p></td>";
                        strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='1' /></td>";
                        strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='2' /></td>";
                        strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='3' /></td>";
                        strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='4' /></td>";
                        strTabla += "<td width='5%' class='center'><input type='radio' name='" + objJson[i]["CODAREA"] + "|" + objJson[i]["CODDIM"] + "|" + objJson[i]["CODPRE"] + "' value='0' /></td>";
                        strTabla += "</tr>";
                    }

                } else {
                    strTabla += "</thead></table></div>";
                    if (codfor = "A") {
                        if (objJson[i]["CODAUX"] != "0") {
                            strTabla += "<div style='clear:both;'></div>";
                            strTabla += "<div class='fondo_formularios'>";
                            strTabla += "<p>Por último, a continuación puede registrar algún comentario o sugerencia respecto de lo que usted considere necesario para mejorar la gestión del sostenedor:</p>";
                            strTabla += "<p><textarea name='restxt' class='textarea' value='' id='comentarios' cols='' rows='' disabled >" + objJson[i]["RESTXT"] + "</textarea></p>";
                            strTabla += "</div>";
                        } else {
                            strTabla += "<div style='clear:both;'></div>";
                            strTabla += "<div class='fondo_formularios'>";
                            strTabla += "<p>Por último, a continuación puede registrar algún comentario o sugerencia respecto de lo que usted considere necesario para mejorar la gestión del sostenedor:</p>";
                            strTabla += "<p><textarea name='restxt' class='textarea' id='comentarios' cols='' rows=''></textarea></p>";
                            strTabla += "</div>";
                        }
                    }
                }
            }
        } /*for*/
    } /*if*/
    $("#bloques").html(strTabla).fadeIn('fast');
    //$("#forma").html(codfor).fadeIn('fast');
    $("#rol").html(objJson[largo - 1]["NOMPER"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Parte " + codfor);

    for (var i = 1; i <= contador; i++) {
        $('#bloque' + i).hide();
    }

    $(function () {

        $("#mostrar1").click(function (event) {
            event.preventDefault();
            $("#bloque1").slideToggle();
        });
        $("#bloque1 a").click(function (event) {
            event.preventDefault();
            $("#bloque1").slideUp();
        });

        $("#mostrar2").click(function (event) {
            event.preventDefault();
            $("#bloque2").slideToggle();
        });
        $("#bloque2 a").click(function (event) {
            event.preventDefault();
            $("#bloque2").slideUp();
        });

        $("#mostrar3").click(function (event) {
            event.preventDefault();
            $("#bloque3").slideToggle();
        });
        $("#bloque3 a").click(function (event) {
            event.preventDefault();
            $("#bloque3").slideUp();
        });

        $("#mostrar4").click(function (event) {
            event.preventDefault();
            $("#bloque4").slideToggle();
        });
        $("#bloque4 a").click(function (event) {
            event.preventDefault();
            $("#bloque4").slideUp();
        });

        $("#mostrar5").click(function (event) {
            event.preventDefault();
            $("#bloque5").slideToggle();
        });
        $("#bloque5 a").click(function (event) {
            event.preventDefault();
            $("#bloque5").slideUp();
        });

        $("#mostrar6").click(function (event) {
            event.preventDefault();
            $("#bloque6").slideToggle();
        });
        $("#bloque6 a").click(function (event) {
            event.preventDefault();
            $("#bloque6").slideUp();
        });
    });

}