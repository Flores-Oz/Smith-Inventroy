<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteEnfermera.Master" AutoEventWireup="true" CodeBehind="ProductoEnf.aspx.cs" Inherits="SmithInventory.PagesEnfermera.Producto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .color1 {
            background: #3d72b4;
        }

        .btn-color {
            background-color: #0e1c36;
            color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal text-body-emphasis">Producto</h1>
            <p class="fs-5 text-body-secondary">En este modulo puedes agregar mas productos para tu Sistema</p>
        </div>
    </div>
    <!--  -->
   <!--  Productos -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <!-- Columna para el formulario -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center bg-primary text-white">
                    <h2>Registro de Producto</h2>
                </div>
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <!-- Nombre del Producto -->
                            <div class="col-md-12 mb-3">
                                <asp:Label runat="server" Text="Nombre del Producto" AssociatedControlID="txtNombreProducto" CssClass="form-label"/>
                                <asp:TextBox runat="server" ID="txtNombreProducto" CssClass="form-control" />
                            </div>
                            <!-- Precio de Costo -->
                            <div class="col-md-6 mb-3">
                                <asp:Label runat="server" Text="Precio de Costo" AssociatedControlID="txtPrecioCosto" CssClass="form-label"/>
                                <asp:TextBox runat="server" ID="txtPrecioCosto" CssClass="form-control" TextMode="Number"/>
                            </div>
                            <!-- Precio de Venta -->
                            <div class="col-md-6 mb-3">
                                <asp:Label runat="server" Text="Precio de Venta" AssociatedControlID="txtPrecioVenta" CssClass="form-label"/>
                                <asp:TextBox runat="server" ID="txtPrecioVenta" CssClass="form-control" TextMode="Number"/>
                            </div>
                            <!-- Estado -->
                            <div class="col-md-12 mb-3">
                                <div class="form-check">
                                    <asp:CheckBox runat="server" ID="chkEstado" CssClass="form-control" />
                                    <asp:Label runat="server" Text="Estado" AssociatedControlID="chkEstado" CssClass="form-check-label"/>
                                </div>
                            </div>
                            <!-- Categoría -->
                            <div class="col-md-12 mb-3">
                                <asp:Label runat="server" Text="Categoría" AssociatedControlID="ddlCategoria" CssClass="form-label"/>
                                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <!-- Botón Guardar -->
                        <div class="text-center">
                            <asp:Button ID="ButtonGuardarProducto" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="ButtonGuardarProducto_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- Modales -->
    <div id="messageBoxSuccessProducto" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Producto guardado correctamente.
    </div>
    <div id="messageBoxErrorProducto" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Error al guardar el Producto.
    </div>
    <div id="messageBoxUpdateProducto" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Producto actualizado correctamente.
    </div>
    <!-- Scripts para mostrar los modales -->
    <script type="text/javascript">
        function showSuccessMessageProducto() {
            var messageBox = document.getElementById("messageBoxSuccessProducto");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }

        function showErrorMessageProducto() {
            var messageBox = document.getElementById("messageBoxErrorProducto");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }

        function showUpdateMessageProducto() {
            var messageBox = document.getElementById("messageBoxUpdateProducto");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }
    </script>
    <!--  -->
</asp:Content>
