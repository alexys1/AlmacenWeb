package modelo;

public class Producto {
    private int id;
    private String nombre;
    private double precioCompra;
    private double precioMayor;
    private double precioUnidad;
    private int categoriaId;

    public Producto() {}

    public Producto(int id, String nombre, double precioCompra, double precioMayor, double precioUnidad, int categoriaId) {
        this.id = id;
        this.nombre = nombre;
        this.precioCompra = precioCompra;
        this.precioMayor = precioMayor;
        this.precioUnidad = precioUnidad;
        this.categoriaId = categoriaId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public double getPrecioCompra() { return precioCompra; }
    public void setPrecioCompra(double precioCompra) { this.precioCompra = precioCompra; }

    public double getPrecioMayor() { return precioMayor; }
    public void setPrecioMayor(double precioMayor) { this.precioMayor = precioMayor; }

    public double getPrecioUnidad() { return precioUnidad; }
    public void setPrecioUnidad(double precioUnidad) { this.precioUnidad = precioUnidad; }

    public int getCategoriaId() { return categoriaId; }
    public void setCategoriaId(int categoriaId) { this.categoriaId = categoriaId; }
}

