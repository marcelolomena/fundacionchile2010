function Grafico(titulo, ejeX, div, tipo) {

    var opciones = {
        chart: {
            renderTo: div,
            defaultSeriesType: tipo,
            marginRight: 130,
            marginBottom: 80
            //margin: [50, 50, 130, 25]
        },
        title: {
            text: titulo,
            x: -20 //center
        },
        subtitle: {
            text: 'Fuente: gestiondesostenedores.cl',
            x: -20
        },
        xAxis: {
            categories: ejeX,
            labels: {
                rotation: -45,
                align: 'right'
            }
        },
        yAxis: {
            title: {
                text: 'Puntuación'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
								this.x + ': ' + this.y;
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: 7,
            borderWidth: 0
        },
        series: []
    };

    return opciones;

}

function GraficoBarras(titulo, ejeX, div, tipo) {

    var opciones = {
        chart: {
            renderTo: div,
            defaultSeriesType: 'column'
        },
        title: {
            text: titulo
        },
        subtitle: {
            text: 'Fuente: gestiondesostenedores.cl'
        },
        xAxis: {
            categories: ejeX
        },
        yAxis: {
            min: 0,
            title: {
                text: titulo
            }
        },
        legend: {
            layout: 'vertical',
            backgroundColor: '#FFFFFF',
            align: 'left',
            verticalAlign: 'top',
            x: 100,
            y: 70
        },
        tooltip: {
            formatter: function () {
                return '' +
               this.x + ': ' + this.y + ' personas';
            }
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        credits: {enabled:false},        
        series: []
    };

    return opciones;

}

function GraficoCartesiano(titulo,div) {

    var opciones = {
        chart: {
                 renderTo: div, 
                 defaultSeriesType: 'scatter',
                 zoomType: 'xy'
              },
              title: {
                 text: titulo
              },
              subtitle: {
                 text: 'Fuente: Fundación Chile  2010'
              },
              xAxis: {
                 title: {
                    enabled: true,
                    text: 'Percepción'
                 },
                 startOnTick: true,
                 endOnTick: true,
                 showLastLabel: true
              },
              yAxis: {
                 title: {
                    text: 'Instalación'
                 }
              },
              tooltip: {
                 formatter: function() {
                           return ''+
                       this.x + ' Percepción, ' + this.y + ' Instalación';
                 }
              },
              legend: {
                 layout: 'vertical',
                 align: 'left',
                 verticalAlign: 'top',
                 x: 100,
                 y: 70,
                 backgroundColor: '#FFFFFF',
                 borderWidth: 1
              },
              plotOptions: {
                 scatter: {
                    marker: {
                       radius: 5,
                       states: {
                          hover: {
                             enabled: true,
                             lineColor: 'rgb(100,100,100)'
                          }
                       }
                    },
                    states: {
                       hover: {
                          marker: {
                             enabled: false
                          }
                       }
                    }
                 }
              },series: []
    };

    return opciones;

}

function ReporteArea(codfor,codins) {
    var tdder = "<td align='right'>";
    var tdizq = "<td align='left'>";
    var thder = "<th align='right'>";
    var titulo = "Resultados de evaluación por área: Forma " + codfor;
    var ejeX1 = ['Liderazgo', 'Procesos', 'Recursos', 'Resultados', 'Comunidad'];
    var options = Grafico(titulo, ejeX1, 'grafico', 'column');
    $('#loading').bind('ajaxStart', function () {
        $(this).show();
    }).bind('ajaxStop', function () {
        $(this).hide();
    });

    var jsonStr = "{codfor:'" + codfor + "',codins:'" + codins +"'}";

    $.ajax({
        type: "POST",
        url: "/reporte.aspx/ReporteArea",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            var objJson = JSON.parse(response.d);
            strTabla = "";
            strFila = "";
            strFoot = "";
            var matriz = new Array();
            var actor = new Array();
            var promedio = new Array();
            var area1 = 0;
            var area2 = 0;
            var area3 = 0;
            var area4 = 0;
            var area5 = 0;
            var vueltas = 0;

            for (var i = 0; i < objJson.length; i++) {
                var valores = new Array();
                strFila += "<tr>";
                strFila += tdizq + objJson[i]["NOMPER"] + "</th>";
                strFila += tdder + objJson[i]["AREA1"] + "</td>";
                strFila += tdder + objJson[i]["AREA2"] + "</td>";
                strFila += tdder + objJson[i]["AREA3"] + "</td>";
                strFila += tdder + objJson[i]["AREA4"] + "</td>";
                strFila += tdder + objJson[i]["AREA5"] + "</td>";
                strFila += "</tr>";

                area1 = area1 + parseFloat(objJson[i]["AREA1"]);
                area2 = area2 + parseFloat(objJson[i]["AREA2"]);
                area3 = area3 + parseFloat(objJson[i]["AREA3"]);
                area4 = area4 + parseFloat(objJson[i]["AREA4"]);
                area5 = area5 + parseFloat(objJson[i]["AREA5"]);

                actor.push(objJson[i]["NOMPER"]);
                valores.push(parseFloat(objJson[i]["AREA1"]));
                valores.push(parseFloat(objJson[i]["AREA2"]));
                valores.push(parseFloat(objJson[i]["AREA3"]));
                valores.push(parseFloat(objJson[i]["AREA4"]));
                valores.push(parseFloat(objJson[i]["AREA5"]));
                matriz[i] = valores;
                valores = null;
                vueltas++;
            }

            /*agregando fila de promedios al grafico*/
            actor.push('PROMEDIO');
            promedio.push(redondeo2decimales(area1 / vueltas));
            promedio.push(redondeo2decimales(area2 / vueltas));
            promedio.push(redondeo2decimales(area3 / vueltas));
            promedio.push(redondeo2decimales(area4 / vueltas));
            promedio.push(redondeo2decimales(area5 / vueltas));
            matriz[i] = promedio;

            /*agregando fila de promedios a la tabla*/
            strFoot += "<tr>";
            strFoot += "<th align='left'>PROMEDIO</th>";
            strFoot += thder + redondeo2decimales(area1 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(area2 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(area3 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(area4 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(area5 / vueltas) + "</th>";
            strFoot += "</tr>";

            for (var i = 0; i < matriz.length; i++) {
                options.series.push({
                    name: actor[i],
                    data: matriz[i]
                });
            }

            chart = new Highcharts.Chart(options);

            $('table[id^=areaTBL] tbody tr').addClass("delete");
            $('table[id^=areaTBL] tfoot tr').addClass("delete");
            $('table[id^=areaTBL] tbody').append(strFila);
            $('table[id^=areaTBL] tfoot').append(strFoot);
            $('table[id^=areaTBL]').trigger("update");
            $('table[id^=areaTBL]').trigger("appendCache");
            $('table[id^=areaTBL] tbody tr.delete').remove();
            $('table[id^=areaTBL] tfoot tr.delete').remove();
            $('table[id^=areaTBL]').trigger("update");

        }, //success
        error: function (msg) {
            alert(msg);
            //jAlert("intentelo mas tarde", "Error");
        },
        complete: function (objeto, exito) {

        }
    });  // end $.ajax
}

function ReporteDimension(codfor,codins) {
    var tdder = "<td align='right'>";
    var tdizq = "<td align='left'>";
    var thder = "<th align='right'>";
    var titulo = "Resultados de evaluación por dimensión: Forma " + codfor;
    var ejeX2 = ['Liderazgo', 'Planificación', 'Competencias', 'Financieros', 'Recursos', 'Servicios', 'Orientación', 'Logros', 'Efectividad', 'Participación', 'Comunicación', 'Redes'];
    var options = Grafico(titulo, ejeX2, 'grafico', 'column');//line
    // Eventos globales
    $('#loading').bind('ajaxStart', function () {
        $(this).show();
    }).bind('ajaxStop', function () {
        $(this).hide();
    });

    var jsonStr = "{codfor:'" + codfor + "',codins:'" +codins+ "'}";
    $.ajax({
        type: "POST",
        url: "/reporte.aspx/ReporteDimension",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            var objJson = JSON.parse(response.d);
            strTabla = "";
            strFila = "";
            strFoot = "";
            var matriz = new Array();
            var actor = new Array();
            var promedio = new Array();
            var dim1 = 0;
            var dim2 = 0;
            var dim3 = 0;
            var dim4 = 0;
            var dim5 = 0;
            var dim6 = 0;
            var dim7 = 0;
            var dim8 = 0;
            var dim9 = 0;
            var dim10 = 0;
            var dim11 = 0;
            var dim12 = 0;
            var vueltas = 0;

            for (var i = 0; i < objJson.length; i++) {
                var valores = new Array();
                strFila += "<tr>";
                strFila += tdizq + objJson[i]["NOMPER"] + "</td>";
                strFila += tdder + objJson[i]["DIM1"] + "</td>";
                strFila += tdder + objJson[i]["DIM2"] + "</td>";
                strFila += tdder + objJson[i]["DIM3"] + "</td>";
                strFila += tdder + objJson[i]["DIM4"] + "</td>";
                strFila += tdder + objJson[i]["DIM5"] + "</td>";
                strFila += tdder + objJson[i]["DIM6"] + "</td>";
                strFila += tdder + objJson[i]["DIM7"] + "</td>";
                strFila += tdder + objJson[i]["DIM8"] + "</td>";
                strFila += tdder + objJson[i]["DIM9"] + "</td>";
                strFila += tdder + objJson[i]["DIM12"] + "</td>";
                strFila += tdder + objJson[i]["DIM11"] + "</td>";
                strFila += tdder + objJson[i]["DIM12"] + "</td>";
                strFila += "</tr>";

                dim1 = dim1 + parseFloat(objJson[i]["DIM1"]);
                dim2 = dim2 + parseFloat(objJson[i]["DIM2"]);
                dim3 = dim3 + parseFloat(objJson[i]["DIM3"]);
                dim4 = dim4 + parseFloat(objJson[i]["DIM4"]);
                dim5 = dim5 + parseFloat(objJson[i]["DIM5"]);
                dim6 = dim6 + parseFloat(objJson[i]["DIM6"]);
                dim7 = dim7 + parseFloat(objJson[i]["DIM7"]);
                dim8 = dim8 + parseFloat(objJson[i]["DIM8"]);
                dim9 = dim9 + parseFloat(objJson[i]["DIM9"]);
                dim10 = dim10 + parseFloat(objJson[i]["DIM10"]);
                dim11 = dim11 + parseFloat(objJson[i]["DIM11"]);
                dim12 = dim12 + parseFloat(objJson[i]["DIM12"]);

                actor.push(objJson[i]["NOMPER"]);
                valores.push(parseFloat(objJson[i]["DIM1"]));
                valores.push(parseFloat(objJson[i]["DIM2"]));
                valores.push(parseFloat(objJson[i]["DIM3"]));
                valores.push(parseFloat(objJson[i]["DIM4"]));
                valores.push(parseFloat(objJson[i]["DIM5"]));
                valores.push(parseFloat(objJson[i]["DIM6"]));
                valores.push(parseFloat(objJson[i]["DIM7"]));
                valores.push(parseFloat(objJson[i]["DIM8"]));
                valores.push(parseFloat(objJson[i]["DIM9"]));
                valores.push(parseFloat(objJson[i]["DIM10"]));
                valores.push(parseFloat(objJson[i]["DIM11"]));
                valores.push(parseFloat(objJson[i]["DIM12"]));
                matriz[i] = valores;
                valores = null;
                vueltas++;
            }

            //alert(i);

            /*agregando fila de promedios al grafico*/
            actor.push('PROMEDIO');
            promedio.push(redondeo2decimales(dim1 / vueltas));
            promedio.push(redondeo2decimales(dim2 / vueltas));
            promedio.push(redondeo2decimales(dim3 / vueltas));
            promedio.push(redondeo2decimales(dim4 / vueltas));
            promedio.push(redondeo2decimales(dim5 / vueltas));
            promedio.push(redondeo2decimales(dim6 / vueltas));
            promedio.push(redondeo2decimales(dim7 / vueltas));
            promedio.push(redondeo2decimales(dim8 / vueltas));
            promedio.push(redondeo2decimales(dim9 / vueltas));
            promedio.push(redondeo2decimales(dim10 / vueltas));
            promedio.push(redondeo2decimales(dim11 / vueltas));
            promedio.push(redondeo2decimales(dim12 / vueltas));
            matriz[i] = promedio;

            /*agregando fila de promedios a la tabla*/

            strFoot += "<tr>";
            strFoot += "<th align='left'>PROMEDIO</th>";
            strFoot += thder + redondeo2decimales(dim1 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(dim2 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(dim3 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(dim4 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(dim5 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(dim6 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(dim7 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(dim8 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(dim9 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(dim10 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(dim11 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(dim12 / vueltas) + "</th>";
            strFoot += "</tr>";

            for (var i = 0; i < matriz.length; i++) {
                options.series.push({
                    name: actor[i],
                    data: matriz[i]
                });
            }

            chart = new Highcharts.Chart(options);

            $('table[id^=dimensionTBL] tbody tr').addClass("delete");
            $('table[id^=dimensionTBL] tfoot tr').addClass("delete");
            $('table[id^=dimensionTBL] tbody').append(strFila);
            $('table[id^=dimensionTBL] tfoot').append(strFoot);
            $('table[id^=dimensionTBL]').trigger("update");
            $('table[id^=dimensionTBL]').trigger("appendCache");
            $('table[id^=dimensionTBL] tbody tr.delete').remove();
            $('table[id^=dimensionTBL] tfoot tr.delete').remove();
            $('table[id^=dimensionTBL]').trigger("update");

        }, /*success*/
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
            alert(msg);
        },
        complete: function (objeto, exito) {

        }
    }); // end $.ajax

}

function ReporteMejoria(codins) {
    var tdder = "<td align='right'>";
    var tdizq = "<td align='left'>";
    var thder = "<th align='right'>";
    var titulo = "Resultados de evaluación: Grado de Mejoría";
    var ejeX3 = ['Área 1', 'Área 2', 'Área 3', 'Área 4', 'Área 6', 'Área 6'];
    var options = Grafico(titulo, ejeX3, 'grafico', 'column');
    $('#loading').bind('ajaxStart', function () {
        $(this).show();
    }).bind('ajaxStop', function () {
        $(this).hide();
    });

    var jsonStr = "{codins:'" + codins + "'}";

    $.ajax({
        type: "POST",
        url: "/reporte.aspx/ReporteMejoria",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            var objJson = JSON.parse(response.d);
            strTabla = "";
            strFila = "";
            strFoot = "";
            var matriz = new Array();
            var actor = new Array();
            var promedio = new Array();
            var area1 = 0;
            var area2 = 0;
            var area3 = 0;
            var area4 = 0;
            var area5 = 0;
            var area6 = 0;
            var vueltas = 0;

            for (var i = 0; i < objJson.length; i++) {
                var valores = new Array();
                strFila += "<tr>";
                strFila += tdizq + objJson[i]["NOMPER"] + "</th>";
                strFila += tdder + objJson[i]["AREA1"] + "</td>";
                strFila += tdder + objJson[i]["AREA2"] + "</td>";
                strFila += tdder + objJson[i]["AREA3"] + "</td>";
                strFila += tdder + objJson[i]["AREA4"] + "</td>";
                strFila += tdder + objJson[i]["AREA5"] + "</td>";
                strFila += tdder + objJson[i]["AREA6"] + "</td>";
                strFila += "</tr>";

                area1 = area1 + parseFloat(objJson[i]["AREA1"]);
                area2 = area2 + parseFloat(objJson[i]["AREA2"]);
                area3 = area3 + parseFloat(objJson[i]["AREA3"]);
                area4 = area4 + parseFloat(objJson[i]["AREA4"]);
                area5 = area5 + parseFloat(objJson[i]["AREA5"]);
                area6 = area6 + parseFloat(objJson[i]["AREA5"]);

                actor.push(objJson[i]["NOMPER"]);
                valores.push(parseFloat(objJson[i]["AREA1"]));
                valores.push(parseFloat(objJson[i]["AREA2"]));
                valores.push(parseFloat(objJson[i]["AREA3"]));
                valores.push(parseFloat(objJson[i]["AREA4"]));
                valores.push(parseFloat(objJson[i]["AREA5"]));
                valores.push(parseFloat(objJson[i]["AREA6"]));
                matriz[i] = valores;
                valores = null;
                vueltas++;
            }

            /*agregando fila de promedios al grafico*/
            actor.push('PROMEDIO');
            promedio.push(redondeo2decimales(area1 / vueltas));
            promedio.push(redondeo2decimales(area2 / vueltas));
            promedio.push(redondeo2decimales(area3 / vueltas));
            promedio.push(redondeo2decimales(area4 / vueltas));
            promedio.push(redondeo2decimales(area5 / vueltas));
            promedio.push(redondeo2decimales(area6 / vueltas));
            matriz[i] = promedio;

            /*agregando fila de promedios a la tabla*/
            strFoot += "<tr>";
            strFoot += "<th align='left'>PROMEDIO</th>";
            strFoot += thder + redondeo2decimales(area1 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(area2 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(area3 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(area4 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(area5 / vueltas) + "</th>";
            strFoot += thder + redondeo2decimales(area6 / vueltas) + "</th>";
            strFoot += "</tr>";

            for (var i = 0; i < matriz.length; i++) {
                options.series.push({
                    name: actor[i],
                    data: matriz[i]
                });
            }

            chart = new Highcharts.Chart(options);

            $('table[id^=mejoriaTBL] tbody tr').addClass("delete");
            $('table[id^=mejoriaTBL] tfoot tr').addClass("delete");
            $('table[id^=mejoriaTBL] tbody').append(strFila);
            $('table[id^=mejoriaTBL] tfoot').append(strFoot);
            $('table[id^=mejoriaTBL]').trigger("update");
            $('table[id^=mejoriaTBL]').trigger("appendCache");
            $('table[id^=mejoriaTBL] tbody tr.delete').remove();
            $('table[id^=mejoriaTBL] tfoot tr.delete').remove();
            $('table[id^=mejoriaTBL]').trigger("update");

        }, //success
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
            alert(msg);
        },
        complete: function (objeto, exito) {

        }
    }); // end $.ajax
}

function ReporteInscritos(codins, codfor, div) {
    var titulo = "Actores: Parte A";
    var ejeX4 = ['Alumno', 'Apoderado', 'Asistente', 'Director', 'Docente', 'Jefe técnico', 'Sostenedor'];
    var options = GraficoBarras(titulo, ejeX4, div, 'column');
    $('#loading').bind('ajaxStart', function () {
        $(this).show();
    }).bind('ajaxStop', function () {
        $(this).hide();
    });

    var jsonStr = "{codins:'" + codins + "',codfor:'" + codfor + "'}";

    $.ajax({
        type: "POST",
        url: "/reporte.aspx/ReporteInscritos",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            var objJson = JSON.parse(response.d);
            var inscritos = new Array();
            var incompleta = new Array();
            var terminada = new Array();

            if (objJson.inscritos.length > 0) {
                $.each(objJson.inscritos, function (i, ins) {
                    inscritos.push(parseFloat(ins.INSCRITOS));
                    incompleta.push(parseFloat(ins.INCOMPLETA));
                    terminada.push(parseFloat(ins.TERMINADA));
                });
            }

            options.series.push({ name: 'sin contestar encuesta', data: inscritos });
            options.series.push({ name: 'encuesta incompleta', data: incompleta });
            options.series.push({ name: 'encuesta terminada', data: terminada });

            chart = new Highcharts.Chart(options);

        }, //success
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
            alert(msg);
        },
        complete: function (objeto, exito) {

        }
    }); // end $.ajax
}

function ReporteAreaCartesiano(codins) {
    var txt="Percepción versus Instalación por Área";
    var options = GraficoCartesiano(txt,'grafico');

    $('#loading').bind('ajaxStart', function () {
        $(this).show();
    }).bind('ajaxStop', function () {
        $(this).hide();
    });

    jsonStr = "{codins:'" + codins + "'}"

    $.ajax({
        type: "POST",
        url: "/reporte.aspx/ReporteAreaCartesiano",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            var objJson = JSON.parse(response.d);
            var color = new Array();
            var matriz = new Array();

            color.push('rgba(223, 83, 83, 1)');
            color.push('rgba(119, 152, 191, 1)');
            color.push('rgba(255, 125, 0, 1)');
            color.push('rgba(200, 152, 33, 1)');
            color.push('rgba(190, 66, 88, 1)');

            for (var i = 0; i < objJson.length; i++) {
                var punto = new Array();
                var matriz = new Array();
                //alert("(" + objJson[i]["COX"] + "," + objJson[i]["COY"] + ")");
                punto.push(parseFloat(objJson[i]["COX"]));
                punto.push(parseFloat(objJson[i]["COY"]));
                matriz.push(punto);

                
                options.series.push({
                name: objJson[i]["GLOSA"],
                color: color[i],
                data: matriz
                });
                

            }

            chart = new Highcharts.Chart(options);


        }, //success
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
            alert(msg);
        },
        complete: function (objeto, exito) {

        }
    });      // end $.ajax
}

function ReporteDimensionCartesiano(codins) {
    var txt = "Percepción versus Instalación por Dimensión";
    var options = GraficoCartesiano(txt,'grafico');

    $('#loading').bind('ajaxStart', function () {
        $(this).show();
    }).bind('ajaxStop', function () {
        $(this).hide();
    });

    jsonStr = "{codins:'" + codins + "'}"

    $.ajax({
        type: "POST",
        url: "/reporte.aspx/ReporteDimensionCartesiano",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            var objJson = JSON.parse(response.d);
            var color = new Array();

            color.push('rgba(223, 83, 83, 1)');
            color.push('rgba(119, 152, 191, 1)');
            color.push('rgba(255, 125, 0, 1)');

            color.push('rgba(223, 83, 11, 1)');
            color.push('rgba(119, 16, 78, 1)');
            color.push('rgba(255, 125, 91, 1)');

            color.push('rgba(11, 156, 83, 1)');
            color.push('rgba(45, 152, 191, 1)');
            color.push('rgba(89, 125, 178, 1)');

            color.push('rgba(11, 33, 54, 1)');
            color.push('rgba(45, 67, 27, 1)');
            color.push('rgba(89, 26, 83, 1)');



            for (var i = 0; i < objJson.length; i++) {
                var punto = new Array();
                var matriz = new Array();
                punto.push(parseFloat(objJson[i]["COX"]));
                punto.push(parseFloat(objJson[i]["COY"]));
                matriz.push(punto);

                options.series.push({
                    name: objJson[i]["GLOSA"],
                    color: color[i],
                    data: matriz
                });

            }

            chart = new Highcharts.Chart(options);


        }, //success
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
            alert(msg);
        },
        complete: function (objeto, exito) {

        }
    });   // end $.ajax
}


function redondeo2decimales(numero) {
    var result = Math.round(numero * 100) / 100;
    return result;
} 