<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Venta.aspx.cs" Inherits="SmithInventory.PagesAdmin.Venta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal text-body-emphasis">Modulo de Venta</h1>
            <p class="fs-5 text-body-secondary">Bienvenido al Modulo de Venta, en este apartado puedes Registrar una Venta, esta quedara registrada que fue realizada por un Administrador</p>
        </div>
    </div>
      <!--  -->
    <div class="container py-4">
        <!-- -->
     <div class="card">
            <div class="card-header bg-primary text-white">
                <h2>Registrar Venta</h2>
            </div>
            <div class="card-body">
                <!-- Sección de Datos de la Venta -->
                <div class="form-group">
                    <label for="fechaVenta">Fecha de Venta:</label>
                    <asp:TextBox ID="txtFechaVenta" runat="server" CssClass="form-control" Type="date"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="totalVenta">Total de la Venta:</label>
                    <asp:TextBox ID="txtTotalVenta" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>

                <!-- Sección de Productos -->
                <div class="form-group">
                    <h4>Agregar Productos</h4>
                    <table class="table table-bordered" id="tablaProductos">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                                <th>Subtotal</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlProducto" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </td>
                                <td><asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td><asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox></td>
                                <td><asp:TextBox ID="txtSubtotal" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox></td>
                                <td>
                                    <asp:Button ID="btnAgregarProducto" runat="server" CssClass="btn btn-success" Text="Agregar" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer text-right">
                <asp:Button ID="btnGuardarVenta" runat="server" CssClass="btn btn-primary" Text="Guardar Venta"  />
            </div>
        </div>
        <!-- -->
        </div>
</asp:Content>
