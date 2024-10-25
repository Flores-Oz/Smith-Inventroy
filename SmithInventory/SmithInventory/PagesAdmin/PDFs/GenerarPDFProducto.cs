using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using QuestPDF.Drawing;
using SmithInventory.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using QuestPDF.Fluent;
using System.Reflection;

namespace SmithInventory.PagesAdmin.PDFs
{
    public class GenerarPDFProducto
    {
        public static IEnumerable<Producto> ConvertToVistaProductos(IEnumerable<Producto> prodList)
        {
            return prodList.Select(prod => new Producto
            {
                IdProducto = prod.IdProducto,
                NombreProducto = prod.NombreProducto,
                PrecioVenta = prod.PrecioVenta,
                PrecioCosto = prod.PrecioCosto,
                ID_Categoria = prod.ID_Categoria,
                Nombre_Categoria = prod.Nombre_Categoria,
                Descripcion_Categoria = prod.Descripcion_Categoria,
                Estado = prod.Estado
            });
        }
        private readonly IEnumerable<Producto> _data;
        public GenerarPDFProducto(IEnumerable<Producto> data) => _data = data;

        public byte[] GeneratePdf()
        {

            var document = Document.Create(doc =>
            {
                Compose(doc);
            });
            return document.GeneratePdf();
        }

        public void Compose(IDocumentContainer container)
        {
            container
                .Page(page =>
                {
                    page.Margin(50);


                    page.Header().Element(ComposeHeader);
                    page.Content().Element(ComposeContent);


                    page.Footer().AlignCenter().Text(x =>
                    {
                        x.CurrentPageNumber();
                        x.Span(" / ");
                        x.TotalPages();
                    });
                });
        }

        void ComposeHeader(IContainer container)
        {
            var titleStyle = TextStyle.Default.FontSize(20).SemiBold().FontColor(Colors.Blue.Medium);

            container.Row(row =>
            {
                row.RelativeItem().Column(column =>
                {
                    column.Item().Text("Reporte de Productos").Style(titleStyle);

                    column.Item().Text(text =>
                    {
                        text.Span("Fecha: ").SemiBold();
                        text.Span($"{DateTime.Now:d}");
                    });

                });

                row.ConstantItem(100).Height(50).Placeholder();
            });
        }

        void ComposeContent(IContainer container)
        {
            container
                .PaddingVertical(40)
                .Height(250)
                .Background(Colors.Grey.Lighten3)
                .AlignCenter()
                .AlignMiddle()
                .Text("Content").FontSize(16);
        }

        void ComposeTable(IContainer container)
        {
            container.Table(table =>
            {
                // step 1
                table.ColumnsDefinition(columns =>
                {
                    columns.ConstantColumn(25);
                    columns.RelativeColumn(3);
                    columns.RelativeColumn();
                    columns.RelativeColumn();
                    columns.RelativeColumn();
                });

                // step 2
                table.Header(header =>
                {
                    header.Cell().Element(CellStyle).Text("ID_Producto");
                    header.Cell().Element(CellStyle).Text("Nombre_Producto");
                    header.Cell().Element(CellStyle).AlignRight().Text("Precio_Costo");
                    header.Cell().Element(CellStyle).AlignRight().Text("Precio_Venta");
                    header.Cell().Element(CellStyle).AlignRight().Text("Estado");
                    header.Cell().Element(CellStyle).AlignRight().Text("ID_Categoria");
                    header.Cell().Element(CellStyle).AlignRight().Text("Nombre_Categoria");
                    header.Cell().Element(CellStyle).AlignRight().Text("Descripcion_Categoria");

                    IContainer CellStyle(IContainer cellcontainer)
                    {
                        return cellcontainer.DefaultTextStyle(x => x.SemiBold()).PaddingVertical(5).BorderBottom(1).BorderColor(Colors.Black);
                    }
                });

                // step 3
                foreach (var item in _data)
                {
                    table.Cell().Element(CellStyle).Text(item.IdProducto.ToString());
                    table.Cell().Element(CellStyle).Text(item.NombreProducto);
                    table.Cell().Element(CellStyle).AlignRight().Text($"{item.PrecioCosto}$");
                    table.Cell().Element(CellStyle).AlignRight().Text($"{item.PrecioVenta}$");
                    table.Cell().Element(CellStyle).AlignRight().Text(item.Estado.ToString());
                    table.Cell().Element(CellStyle).AlignRight().Text(item.ID_Categoria.ToString());
                    table.Cell().Element(CellStyle).AlignRight().Text(item.Nombre_Categoria);
                    table.Cell().Element(CellStyle).AlignRight().Text(item.Descripcion_Categoria);

                    IContainer CellStyle(IContainer cellcontainer)
                    {
                        return cellcontainer.BorderBottom(1).BorderColor(Colors.Grey.Lighten2).PaddingVertical(5);
                    }
                }
            });
        }

    }

    public static class QuestPdfExtensions
    {
        public static IContainer Cell(this IContainer container, bool dark)
        {
            return container
                .Border(1)
                .Background(dark ? Colors.Grey.Lighten2 : Colors.White)
                .Padding(10);
        }
    }
}