
document.addEventListener("DOMContentLoaded", () => {
  const btn = document.querySelector(".hamburger");
  const menu = document.querySelector(".navbar-links");

  btn.addEventListener("click", () => {
    btn.classList.toggle("open");
    menu.classList.toggle("show");
  });
});
document.addEventListener("DOMContentLoaded", function () {
    const inputNombre = document.querySelector('input[name="nombre"]');
    const tabla = document.querySelector("table");
    const verTodoBtn = document.querySelector(".btn-reset");

    if (inputNombre && tabla) {
        inputNombre.addEventListener("input", function () {
            const filtro = inputNombre.value.trim().toLowerCase();
            const filas = tabla.querySelectorAll("tr");

            filas.forEach((fila, index) => {
                if (index === 0) return; // no ocultar encabezado

                const textoFila = fila.textContent.toLowerCase();
                fila.style.display = textoFila.includes(filtro) ? "" : "none";
            });
        });
    }

    if (verTodoBtn) {
        verTodoBtn.addEventListener("click", function (e) {
            e.preventDefault(); // cancela la redirección

            // limpiar campo y mostrar todo
            inputNombre.value = "";
            const filas = tabla.querySelectorAll("tr");
            filas.forEach((fila, index) => {
                if (index === 0) return;
                fila.style.display = "";
            });
        });
    }
});

document.addEventListener("DOMContentLoaded", function () {
    const limpiarBtns = document.querySelectorAll(".limpiar-busqueda");

    limpiarBtns.forEach(btn => {
        btn.addEventListener("click", function () {
            const form = btn.closest("form");
            const input = form.querySelector('input[name="nombre"]');
            const tabla = document.querySelector("table");

            if (input) input.value = "";

            if (tabla) {
                const filas = tabla.querySelectorAll("tr");
                filas.forEach((fila, index) => {
                    if (index === 0) return; // dejar encabezado
                    fila.style.display = "";
                });
            }
        });
    });
});
document.addEventListener("DOMContentLoaded", function () {
    const categoriaSelect = document.getElementById("categoriaIdSelect");
    const formBusqueda = document.getElementById("form-busqueda");

    if (categoriaSelect && formBusqueda) {
        categoriaSelect.addEventListener("change", function () {
            formBusqueda.submit();
        });
    }
});
document.addEventListener("DOMContentLoaded", function () {
    const inputNombre = document.getElementById("busqueda-modificar-nombre");
    const selectCategoria = document.getElementById("busqueda-modificar-categoria");
    const tabla = document.querySelector(".tabla-productos");

    if (!tabla) return;

    const filas = tabla.querySelectorAll("tbody tr");

    function filtrarModificarProductos() {
        const texto = inputNombre?.value.trim().toLowerCase() || "";
        const categoria = selectCategoria?.value || "";

        filas.forEach(fila => {
            const inputNombreFila = fila.querySelector('input[name="nombre"]');
            const selectCategoriaFila = fila.querySelector('select[name="categoriaId"]');

            const valorNombre = inputNombreFila?.value.toLowerCase() || "";
            const valorCategoria = selectCategoriaFila?.value || "";

            const coincideTexto = valorNombre.includes(texto);
            const coincideCategoria = !categoria || categoria === valorCategoria;

            fila.style.display = (coincideTexto && coincideCategoria) ? "" : "none";
        });
    }

    if (inputNombre) inputNombre.addEventListener("input", filtrarModificarProductos);
    if (selectCategoria) selectCategoria.addEventListener("change", filtrarModificarProductos);
    
});
document.addEventListener("DOMContentLoaded", function () {
    const formBusqueda = document.getElementById("form-busqueda");
    const categoriaSelect = document.getElementById("categoriaIdSelect");
    const inputNombre = document.querySelector('input[name="nombre"]');
    const btnReset = document.querySelector(".btn-reset");

    if (categoriaSelect && formBusqueda) {
        categoriaSelect.addEventListener("change", function () {
            formBusqueda.submit(); // 🔄 reenviar al cambiar de categoría
        });
    }

    if (btnReset && inputNombre) {
        btnReset.addEventListener("click", function () {
            inputNombre.value = "";
        });
    }
});
