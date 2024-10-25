using System;
using System.Collections.Generic;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Web;

namespace SmithInventory.PagesAdmin.PDFs
{
    [Table(Name = "Vista_Producto")]
    public class Producto
    {
        [Column]
        public int IdProducto { get; set; }

        [Column]
        public string NombreProducto { get; set; }

        [Column]
        public decimal PrecioVenta { get; set; }

        [Column]
        public decimal PrecioCosto { get; set; }

        [Column]
        public string Descripcion_Categoria { get; set; }

        [Column]
        public int ID_Categoria { get; set; }

        [Column]
        public string Nombre_Categoria { get; set; }

        [Column]
        public bool Estado { get; set; }
    }
}