<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteEnfermera.Master" AutoEventWireup="true" CodeBehind="ClienteEnf.aspx.cs" Inherits="SmithInventory.PagesEnfermera.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal text-body-emphasis">Modulo de Cliente</h1>
            <p class="fs-5 text-body-secondary">Bienvenido al Módulo de Cliente, en este apartado puedes registrar nuevos clientes y administrar su información.</p>
        </div>
    </div>

    <!-- Contenedor principal -->
    <div class="container py-4">
        <!-- Tarjeta para registrar clientes -->
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h2>Registrar Cliente</h2>
            </div>
            <div class="card-body">
                <!-- Sección de datos del cliente -->
                <div class="form-group">
                    <label for="txtIDCliente">DPI:</label>
                    <asp:TextBox ID="txtDPICliente" placeholder="Ingresar DPI sin Espacios" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtNombreCliente">Nombre del Cliente:</label>
                    <asp:TextBox ID="txtNombreCliente" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtTelefonoCliente">Teléfono:</label>
                    <asp:TextBox ID="txtTelefonoCliente" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtCorreoCliente">Tipo Cliente:</label>
                    <asp:DropDownList ID="ddlTipoCliente"  CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="txtDireccionCliente">Dirección:</label>
                    <asp:TextBox ID="txtDireccionCliente" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <br/>
                <div class="card-footer text-right">
                    <asp:Button ID="btnGuardarCliente" runat="server" CssClass="btn btn-primary" OnClick="btnGuardarCliente_Click" Text="Guardar Cliente" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modales de notificación -->
    <div id="messageBoxSuccessCliente" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Cliente Guardado correctamente.
    </div>
    <div id="messageBoxErrorCliente" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Error al actualizar el cliente.
    </div>

    <!-- Scripts para mostrar los modales -->
    <script type="text/javascript">
        function showSuccessMessageCliente() {
            var messageBox = document.getElementById("messageBoxSuccessCliente");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }

        function showErrorMessageCliente() {
            var messageBox = document.getElementById("messageBoxErrorCliente");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }
    </script>


    <!-- Modales para notificaciones -->
    <div id="messageBoxSuccessCliente1" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Cliente guardado correctamente.
    </div>
    <div id="messageBoxErrorCliente1" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Error al guardar el Cliente.
    </div>

    <!-- Scripts para mostrar los modales -->
    <script type="text/javascript">
        function showSuccessMessageCliente() {
            var messageBox = document.getElementById("messageBoxSuccessCliente");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }

        function showErrorMessageCliente() {
            var messageBox = document.getElementById("messageBoxErrorCliente");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }
    </script>
</asp:Content>
