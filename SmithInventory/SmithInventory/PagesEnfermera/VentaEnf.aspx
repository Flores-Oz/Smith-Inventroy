<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteEnfermera.Master" AutoEventWireup="true" CodeBehind="VentaEnf.aspx.cs" Inherits="SmithInventory.PagesEnfermera.VentaEnf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal text-body-emphasis">Módulo de Venta</h1>
            <p class="fs-5 text-body-secondary">Bienvenido al Módulo de Venta. En este apartado puedes registrar una nueva venta y agregar productos a la misma.</p>
        </div>
    </div>

    <!-- Contenedor principal -->
    <div class="container py-4">
        <!-- Tarjeta para registrar ventas -->
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h2>Registrar Venta</h2>
            </div>
            <div class="card-body">
                <!-- Sección de datos de la venta -->
                <div class="form-group">
                    <label for="txtIDVenta">ID Venta:</label>
                    <asp:TextBox ID="txtIDVenta" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtCliente">Cliente:</label>
                    <asp:DropDownList ID="DropDownListCliente" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="txtFechaVenta">Fecha de Venta:</label>
                    <asp:TextBox ID="txtFechaVenta" runat="server" CssClass="form-control" Type="date"></asp:TextBox>
                </div>

                <div class="form-group">
                    <div class="me-3" style="flex-grow: 1;">
                        <label for="txtTotalVenta">Total de la Venta:</label>
                        <asp:TextBox ID="txtTotalVenta" runat="server" AutoPostBack="true" OnTextChanged="txtTotalVenta_TextChanged" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <br/>
                    <!-- Botón Total Venta -->
                    <div>
                        <asp:Button ID="ButtonCalcular" runat="server" CssClass="btn btn-primary" OnClick="ButtonCalcular_Click" Text="Calcular Total Venta" />
                    </div>
                </div>
                <br />
                <!-- Sección de productos -->
                <div class="form-group">
                    <h4>Agregar Productos a la Venta</h4>
                    <table class="table table-bordered" id="tablaProductosVenta">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                                <th>Descuento</th>
                                <th>Subtotal</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlProductoVenta" runat="server" AutoPostBack="true" OnTextChanged="ddlProductoVenta_TextChanged" CssClass="form-control"></asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCantidadVenta" AutoPostBack="true" OnTextChanged="txtCantidadVenta_TextChanged" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtPrecioVenta" runat="server" Enabled="false" CssClass="form-control" ReadOnly="true"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtDescuentoVenta" AutoPostBack="true" OnTextChanged="txtDescuentoVenta_TextChanged" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtSubtotalVenta" runat="server" Enabled="false" CssClass="form-control" OnTextChanged="txtSubtotalVenta_TextChanged" ReadOnly="true"></asp:TextBox></td>
                                <td>
                                    <asp:Button ID="btnAgregarProductoVenta" OnClick="btnAgregarProductoVenta_Click" runat="server" CssClass="btn btn-success" Text="Agregar" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- GridView para productos agregados -->
            <div class="card-body">
                <asp:GridView ID="gvProductosVenta" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" OnRowCommand="gvProductosVenta_RowCommand" DataKeyNames="ProductoID">
                    <Columns>
                        <asp:BoundField DataField="ProductoID" HeaderText="ID Producto" />
                        <asp:BoundField DataField="Producto" HeaderText="Producto" />
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:TextBox ID="txtCantidad" runat="server" Enabled="false" Text='<%# Eval("Cantidad") %>' CssClass="form-control"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Precio">
                            <ItemTemplate>
                                <asp:TextBox ID="txtPrecio" runat="server" Enabled="false" Text='<%# Eval("Precio") %>' CssClass="form-control"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Descuento">
                            <ItemTemplate>
                                <asp:TextBox ID="txtDescuento" runat="server" Enabled="false" Text='<%# Eval("Descuento") %>' CssClass="form-control"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" />

                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btnEliminarProducto" Text="Eliminar" CssClass="btn btn-danger" CommandName="Eliminar" CommandArgument='<%# Eval("ProductoID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="card-footer text-right">
                <asp:Button ID="btnGuardarVenta" runat="server" CssClass="btn btn-primary" OnClick="btnGuardarVenta_Click" Text="Guardar Venta" />
            </div>
        </div>
    </div>

    <!-- Modales -->
    <div id="messageBoxSuccessVenta" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Venta guardada correctamente.
   
    </div>
    <div id="messageBoxErrorVenta" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Error al Guardar la Venta.
   
    </div>

    <!-- Scripts para mostrar los modales -->
    <script type="text/javascript">
        function showSuccessMessageVenta() {
            var messageBox = document.getElementById("messageBoxSuccessVenta");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }

        function showErrorMessageVenta() {
            var messageBox = document.getElementById("messageBoxErrorVenta");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }
    </script>
</asp:Content>
