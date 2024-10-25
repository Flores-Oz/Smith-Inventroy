using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using SmithInventory.DB;
using System;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace SmithInventory.PagesAdmin.PDFs
{
    public class MenuPDF
    {
        private string Reporte { get; set; }
        private string NombreArchivo { get; set; }
        private GridView GridViewReporte { get; set; }

        public MenuPDF(string reporte, string nombreArchivo, GridView gridView)
        {
            Reporte = reporte;
            NombreArchivo = nombreArchivo;
            GridViewReporte = gridView;
        }

        // Método principal para generar y descargar el PDF
        public void DescargarPDF()
        {
            byte[] pdfBytes = GenerarPDF();
            DescargarPDF(NombreArchivo, pdfBytes);
        }

        // Método para generar el PDF basado en el contenido del GridView
        private byte[] GenerarPDF()
        {
            var document = Document.Create(container =>
            {
                container.Page(page =>
                {
                    page.Margin(50);
                    page.Size(PageSizes.A4.Landscape());
                    page.Header().Element(ComposeHeader);
                    page.Content().Element(ComposeContent);

                    page.Footer().AlignCenter().Text(x =>
                    {
                        x.CurrentPageNumber();
                        x.Span(" / ");
                        x.TotalPages();
                    });
                });
            });

            return document.GeneratePdf();
        }

        // Encabezado del PDF
        private void ComposeHeader(IContainer container)
        {
            container.Row(row =>
            {
                row.RelativeItem().Column(column =>
                {
                    column.Item().Text($"Reporte: {Reporte}").FontSize(20).SemiBold().FontColor(Colors.Blue.Medium);
                    column.Item().Text($"Fecha: {DateTime.Now:d}");
                });
                row.ConstantItem(100).Height(50).Placeholder();
            });
        }

        // Contenido del PDF basado en el GridView
        private void ComposeContent(IContainer container)
        {
            container.PaddingVertical(10).Table(table =>
            {
                // Definir las columnas del PDF en función del GridView
                int columnCount = GridViewReporte.HeaderRow.Cells.Count;
                table.ColumnsDefinition(columns =>
                {
                    for (int i = 0; i < columnCount; i++)
                    {
                        columns.RelativeColumn();
                    }
                });

                // Encabezados de la tabla
                table.Header(header =>
                {
                    for (int i = 0; i < columnCount; i++)
                    {
                        header.Cell().Element(CellStyle).Text(GridViewReporte.HeaderRow.Cells[i].Text);
                    }
                });

                // Filas de datos
                foreach (GridViewRow row in GridViewReporte.Rows)
                {
                    for (int i = 0; i < columnCount; i++)
                    {
                        table.Cell().Element(CellStyle).Text(row.Cells[i].Text);
                    }
                }
            });
        }

        // Estilo de celdas
        private static IContainer CellStyle(IContainer container)
        {
            return container.DefaultTextStyle(x => x.SemiBold()).PaddingVertical(5).BorderBottom(1).BorderColor(Colors.Black);
        }

        // Descargar el archivo PDF
        private void DescargarPDF(string nombreArchivo, byte[] pdfBytes)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/pdf";
            HttpContext.Current.Response.AddHeader("content-disposition", $"attachment;filename={nombreArchivo}");
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.BinaryWrite(pdfBytes);
            HttpContext.Current.Response.End();
        }
    }
}
