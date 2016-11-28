//Carro de compras
function getItemsCarro() {
    $.ajax({
        url: "Carroes/getItemsCarro",
        data: {},
        success: function (pagina) {
            $("#items_carro").html(pagina);
        },
        method: "post"
    });
}

function cargar_carrocompras(dis_id, usu_rut, dis_alb) {
    if (dis_id == -1) {
        getItemsCarro();
        // Carga el carro
        $.ajax({
            url: "Carroes/getMiniCarro",
            data: {},
            success: function (pagina) {
                $("#mi_carro_compras").html(pagina);
            },
            method: "post"
        });
    } else {
        //Miestra el producto y pide seleccionar la cantidad de discos iguales que desea comprar
        document.getElementById("usu_rut").value = usu_rut;
        document.getElementById("dis_id").value = dis_id;
        document.getElementById("dis_alb").value = dis_alb;
        //$("#usu_rut").value = usu_rut;
        //$("#dis_id").value = dis_id;
        //$("#dis_alb").value = dis_alb;
    }
}

function agregarAlCarro() {
    // Agrega el producto al carro
    $.post("Carroes/Guardar", {
        usu_rut: $("#usu_rut").val(),
        dis_id: $("#dis_id").val(),
        car_can: $("#car_can").val()
    }, function (dato) {
        document.getElementById("mensaje_agregar").innerHTML = dato;
        //$("mensaje_agregar").html(dato);
        getItemsCarro();
    }, "json");
}

// Elimina iem del carro
function carrocompras_eliminar(dis_id) {
    $.post("Carroes/Eliminar", {
        dis_id: dis_id
    }, function (dato) {
        getItemsCarro()
        // Carga el carro
        //$.ajax({
        //    url: base_url + "index.php/c_getPage/mi_carrocompras",
        //    data: {},
        //    success: function (pagina) {
        //        getItemsCarro();

        //        $("#mi_carro_compras").html(pagina);
        //    },
        //    method: "post"
        //});
    }, "json");
}