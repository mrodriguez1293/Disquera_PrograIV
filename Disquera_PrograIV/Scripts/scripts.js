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

function cargar_carrocompras(dis_id, usu_rut) {
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
        // Agrega el producto al carro
        $.post("Carroes/Guardar", {
            usu_rut: usu_rut,
            dis_id: dis_id,
            car_can: 0
        }, function (dato) {
            getItemsCarro();
            // Carga al carro
            //$.ajax({
            //    url: base_url + "index.php/c_getPage/mi_carrocompras",
            //    data: {},
            //    success: function (pagina) {
            //        $("#mi_carro_compras").html(pagina);
            //    },
            //    method: "post"
            //});

        }, "json");

    }
}