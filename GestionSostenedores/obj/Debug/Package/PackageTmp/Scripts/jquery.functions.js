function ValidaIngreso() {

    var params = $('form[id$=formulario]').serialize();
    var jsonStr = "{qs:'" + params + "'}";

    $.ajax({
        type: "POST",
        url: "/acceso.aspx/ValidaIngreso",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            var objJson = JSON.parse(response.d);
            if (objJson[0]["OK"] == "SI") {
                var url = "esquema.aspx";
                $(location).attr('href', url);
            } else {
                jAlert("Reingrese nuevamente su contraseña", "clave incorrecta");
            }

        },
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}

function IrRegistro(codins, actualiza) {
    var jsonStr = "{codins:'" + codins + "'}";
    var strFilaUsuarios = ""
    $("#formulario").hide();
    $.ajax({
        type: "POST",
        url: "/registro.aspx/ObtenerUsuariosPorInstitucion",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            var objJson = JSON.parse(response.d);
            if (objJson.usuarios.length > 0) {
                $("#recargar").attr('href', 'javascript:IrRegistro(' + codins + ',true)');
                $.each(objJson.usuarios, function (i, usu) {
                    strFilaUsuarios += "<tr>";
                    strFilaUsuarios += "<td>" + (i + 1) + "</td>";
                    strFilaUsuarios += "<td>" + usu.NOMUSU + "</td>";
                    strFilaUsuarios += "<td>" + usu.APEPAUSU + "</td>";
                    strFilaUsuarios += "<td><a href=\"javascript:goMostrarPopupLoad('algo', 'usuario.aspx?accion=edit&codusu=" + usu.CODUSU + "', 100, 800, 450,'#col_02')\" onmouseover=\"handleOverBotonEditar();return true;\" onmouseout=\"handleOutBotonEditar();return true;\"><img name=\"imgBotonEditar\" width=\"32\" height=\"31\" border=\"0\" alt=\"editar\" src=\"../images/botones/b_editar_off.gif\"/></a></td>";
                    strFilaUsuarios += "<td><a href=\"javascript:openDialog('" + usu.CODUSU + "');\" onmouseover=\"handleOverBotonMenos();return true;\" onmouseout=\"handleOutBotonMenos();return true;\"><img name=\"imgBotonMenos\" width=\"32\" height=\"31\" border=\"0\" alt=\"menos\" src=\"../images/botones/b_menos_off.gif\" /></a></td>";
                    strFilaUsuarios += "<td><a href=\"javascript:goMostrarPopupLoad('algo', 'usuario.aspx?codins=" + codins + "', 100, 800, 450,'#col_02')\" onmouseout=\"handleOutBotonMas();return true;\"><img name=\"imgBotonMas\" width=\"32\" height=\"31\" border=\"0\" alt=\"mas\" src=\"../images/botones/b_mas_off.gif\" /></a></td>";
                    strFilaUsuarios += "</tr>";
                });

            } else {
                strFilaUsuarios += "<table>";
                strFilaUsuarios += "<tr>";
                strFilaUsuarios += "<td>Agregar usuario</td>";
                strFilaUsuarios += "<td><a href=\"javascript:goMostrarPopupLoad('algo', 'usuario.aspx?codins=" + codins + "', 100, 800, 450,'#col_02')\" onmouseout=\"handleOutBotonMas();return true;\"><img name=\"imgBotonMas\" width=\"32\" height=\"31\" border=\"0\" alt=\"mas\" src=\"../images/botones/b_mas_off.gif\" /></a></td>";
                strFilaUsuarios += "</tr>";
                strFilaUsuarios += "</table>";
            }

            if (actualiza) {
                $("#tblUsuariosSys").animate({ opacity: 'hide' }, "slow");
                $('table[id^=tblUsr] tbody').append(strFilaUsuarios);
                $("#tblUsr").tablesorter().tablesorterPager({ container: $("#pager") });
                $("#col_02").animate({ opacity: 'show' }, "slow");
            } else {
                $('table[id^=tblUsr] tbody').append(strFilaUsuarios);
                $("#tblUsr").tablesorter().tablesorterPager({ container: $("#pager") });
                $("#tblUsuariosSys").show("slow");
            }

        },
        error: function (msg) {
            alert("intentelo mas tarde");
        },
        complete: function (objeto, exito) {

        }
    });
}


function llamarPagina(tabla, formulario, pagina) {
    $(tabla).hide();
    $(formulario).show();
    $.ajax({
        url: pagina,
        type: "GET",
        success: function (datos) {
            $(formulario).html(datos);
        }
    });
}

function Cancelar(tabla, formulario) {
    $(formulario).hide();
    $(tabla).show();
}

function GuardarInstitucion(codusu) {
    var params = $('form[id$=frm_identificacion]').serialize();
    var jsonStr = "{qs:'" + params + "',codusu:'" + codusu + "'}";
    $.ajax({
        type: "POST",
        url: "/institucion.aspx/ActualizarInstitucion",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
        },
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
    $("#formulario1").hide();
    $("#tabla1").show();

}

function GuardarEstablecimiento(codins) {
    var params = $('form[id$=frmEstablecimientoNuevo]').serialize();
    var jsonStr = "{qs:'" + params + "',codins:'" + codins + "'}";

    $.ajax({
        type: "POST",
        url: "/establecimiento.aspx/GuardarEstablecimiento",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario1").hide();
            $("#tabla1").show();
        },
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}


function ActualizarEstablecimiento(codest) {
    var params = $('form[id$=frmEstablecimientoNuevo]').serialize();
    var jsonStr = "{qs:'" + params + "',codest:'" + codest + "'}";

    $.ajax({
        type: "POST",
        url: "/establecimiento.aspx/ActualizarEstablecimiento",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario1").hide();
            $("#tabla1").show();
        },
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}

function EliminarEstablecimiento(codest, codins) {
    var jsonStr = "{codest:'" + codest + "',codins:'" + codins + "'}";

    $.ajax({
        type: "POST",
        url: "/establecimiento.aspx/EliminarEstablecimiento",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario1").hide();
            $("#tabla1").show();

        },
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}

function ObtenerEstablecimiento() {

    var jsonStr = "{}";

    $.ajax({
        type: "POST",
        url: "/institucion.ascx/ObtenerEstablecimiento",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            var objJson = JSON.parse(response.d);
        },
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}


function GuardarEficiencia(codest) {
    var params = $('form[id$=frmEficienciaNueva]').serialize();
    var jsonStr = "{qs:'" + params + "',codest:'" + codest + "'}";

    $.ajax({
        type: "POST",
        url: "/eficiencia.aspx/GuardarEficiencia",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario3").hide();
            $("#tabla3").show();

        }, error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}

function GuardarPlanificacion(codest) {
    var params = $('form[id$=frmPlanificacionNueva]').serialize();
    var jsonStr = "{qs:'" + params + "',codusu:'" + codusu + "'}";

    $.ajax({
        type: "POST",
        url: "/planificacion.aspx/GuardarPlanificacion",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario7").hide();
            $("#tabla7").show();
        }, error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}

function GuardarProyectos(codest) {
    var params = $('form[id$=frmProyectosNueva]').serialize();
    var jsonStr = "{qs:'" + params + "',codest:'" + codest + "'}";

    $.ajax({
        type: "POST",
        url: "/proyectos.aspx/GuardarProyectos",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario8").hide();
            $("#tabla8").show();
        }, error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}


function GuardarVulnerabilidad(codest) {
    var params = $('form[id$=frmVulnerabilidadNueva]').serialize();
    var jsonStr = "{qs:'" + params + "',codest:'" + codest + "'}";
    $.ajax({
        type: "POST",
        url: "/vulnerabilidad.aspx/GuardarVulnerabilidad",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario4").hide();
            $("#tabla4").show();

        }, error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}

function GuardarResultados(codest) {
    var params = $('form[id$=frmResultadosNueva]').serialize();
    var jsonStr = "{qs:'" + params + "',codest:'" + codest + "'}";
    $.ajax({
        type: "POST",
        url: "/resultados.aspx/GuardarResultados",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario5").hide();
            $("#tabla5").show();

        }, error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}

function GuardarFinanzas(codusu) {
    var params = $('form[id$=frmFinanzasNueva]').serialize();
    var jsonStr = "{qs:'" + params + "',codusu:'" + codusu + "'}";
    $.ajax({
        type: "POST",
        url: "/finanzas.aspx/GuardarFinanzas",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario6").hide();
            $("#tabla6").show();
        }, error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });

}

function GuardarRedes(codusu) {
    var params = $('form[id$=frmRedesNueva]').serialize();
    var jsonStr = "{qs:'" + params + "',codusu:'" + codusu + "'}";
    $.ajax({
        type: "POST",
        url: "/redes.aspx/GuardarRedes",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario9").hide();
            $("#tabla9").show();

        }, error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });

}


function GuardarInfraestructura(codest) {
    var params = $('form[id$=frmInfraestructuraNueva]').serialize();
    var jsonStr = "{qs:'" + params + "',codest:'" + codest + "'}";
    $.ajax({
        type: "POST",
        url: "/infraestructura.aspx/GuardarInfraestructura",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario12").hide();
            $("#tabla12").show();

        }, error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}

function GuardarDemografia(codusu) {
    var params = $('form[id$=frmDemografiaNueva]').serialize();
    var jsonStr = "{qs:'" + params + "',codusu:'" + codusu + "'}";

    $.ajax({
        type: "POST",
        url: "/demografia.aspx/GuardarDemografia",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario11").hide();
            $("#tabla11").show();
        }, error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}

function GuardarEspacial(codest) {
    var params = $('form[id$=frmEspacialNueva]').serialize();
    var jsonStr = "{qs:'" + params + "',codest:'" + codest + "'}";

    $.ajax({
        type: "POST",
        url: "/espacial.aspx/GuardarEspacial",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            $("#formulario10").hide();
            $("#tabla10").show();
        },
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
}


function ver_mapa(codest, tipo) {
    var objJson;
    var jsonStr = "{codest:'" + codest + "',tipo:'" + tipo + "'}";
    var tag = "#frmEspacialNueva";
    var txt = "mapa"; // nombre del div
    var strDato = "<h1>Hola</h1>"; // contenido del div
    var nTime = 0; // TimeOff
    var nWidth = 400; // ancho del div
    var nHeight = 300; // alto del div

    $.ajax({
        type: "POST",
        url: "/espacial.aspx/ObtenerCoordenadas",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            objJson = JSON.parse(response.d);
            goMostrarPopup(tipo, objJson, txt, strDato, nTime, nWidth, nHeight, tag);
        },
        error: function (msg) {
            alert("intentelo mas tarde");
        },
        complete: function (objeto, exito) {

        }
    });
}

function GuardarUsuario(codins) {
    var params = $('form[id$=frmusuario]').serialize();
    var jsonStr = "{qs:'" + params + "',codins:'" + codins + "'}";

    $.ajax({
        type: "POST",
        url: "/registro.aspx/GuardarUsuario",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            objJson = JSON.parse(response.d);

            if (objJson.error) {
                abreDialogo(objJson.msg);
            } else {
                abreDialogo('usuario agregado correctamente a la base de datos');
            }
        },
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });

}

function abreDialogo(msg) {
    var $dialog = $("#dialog")
	.html(msg)
	.dialog({
	    bgiframe: true,
	    resizable: false,
	    draggable: true,
	    autoOpen: false,
	    height: 140,
	    modal: true,
	    overlay: {
	        backgroundColor: '#000',
	        opacity: 0.5
	    },
	    buttons: {
	        'Cerrar': function () {
	            $(this).dialog('close');
	        }
	    }
	});

    $dialog.dialog('open');

}


