$(document).ready(function() {
    lucide.createIcons();

    // Listener para mensajes NUI desde Lua
    window.addEventListener('message', function(event) {
        let item = event.data;

        if (item.action === "open") {
            // Rellenar datos
            $("#char-id").text(item.data.id);
            $("#char-name").text(item.data.name);
            $("#char-job").text(item.data.job);
            
            // Formatear dinero
            let formatter = new Intl.NumberFormat('en-US', {
                style: 'currency',
                currency: 'USD',
                maximumFractionDigits: 0
            });
            
            $("#char-money").text(formatter.format(item.data.money));
            $("#char-bank").text(formatter.format(item.data.bank));

            // Mugshot
            if (item.data.mugshotTxd) {
                let imgUrl = `https://nui-img/${item.data.mugshotTxd}/${item.data.mugshotTxd}?t=${new Date().getTime()}`;
                $("#char-mugshot").attr("src", imgUrl).show();
            } else {
                $("#char-mugshot").hide();
                $("#char-mugshot").attr("src", "");
            }

            // Mostrar UI
            $("#app").fadeIn(300);
        }

        if (item.action === "close") {
            $("#app").fadeOut(300, function() {
                $("#char-mugshot").attr("src", ""); // Clean up
            });
        }

        if (item.action === "updateStats") {
            $("#stat-online").text(item.data.online);
            if (item.data.online > 0) {
                $("#stat-online").parent().parent().addClass("active-green");
            } else {
                $("#stat-online").parent().parent().removeClass("active-green");
            }

            if (item.data.police) {
                $("#stat-police").addClass("active-blue");
                $("#val-police").text("Disponible");
            } else {
                $("#stat-police").removeClass("active-blue");
                $("#val-police").text("No Disponible");
            }

            if (item.data.ems) {
                $("#stat-ems").addClass("active-red");
                $("#val-ems").text("Disponible");
            } else {
                $("#stat-ems").removeClass("active-red");
                $("#val-ems").text("No Disponible");
            }

            if (item.data.admin) {
                $("#stat-admin").addClass("active-yellow");
                $("#val-admin").text("Disponible");
            } else {
                $("#stat-admin").removeClass("active-yellow");
                $("#val-admin").text("No Disponible");
            }
        }
    });

    // Sonidos nativos
    $(".action-btn, .social-btn").mouseenter(function() {
        $.post(`https://${GetParentResourceName()}/playSound`, JSON.stringify({ name: "hover" }));
    });

    $(".action-btn, .social-btn").mousedown(function() {
        $.post(`https://${GetParentResourceName()}/playSound`, JSON.stringify({ name: "click" }));
    });

    // Cerrar con tecla ESC
    document.onkeydown = function(data) {
        if (data.key == "Escape" || data.key == "Esc") {
            $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        }
    };

    // Botones
    $("#btn-map").click(function() {
        $.post(`https://${GetParentResourceName()}/map`, JSON.stringify({}));
    });

    $("#btn-settings").click(function() {
        $.post(`https://${GetParentResourceName()}/settings`, JSON.stringify({}));
    });

    $("#btn-logout").click(function() {
        $.post(`https://${GetParentResourceName()}/logout`, JSON.stringify({}));
    });

    $("#btn-quit").click(function() {
        $.post(`https://${GetParentResourceName()}/quit`, JSON.stringify({}));
    });

    $("#btn-close").click(function() {
        $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
    });
});
