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

function cargar_carrocompras(dis_id) {
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
        $.post(base_url + "index.php/c_carro/guardar", {
            dis_id: dis_id
        }, function (dato) {
            getItemsCarro();
            // Carga al carro
            $.ajax({
                url: base_url + "index.php/c_getPage/mi_carrocompras",
                data: {},
                success: function (pagina) {
                    $("#mi_carro_compras").html(pagina);
                },
                method: "post"
            });

        }, "json");

    }
}