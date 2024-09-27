<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="SmithInventory.PagesAdmin.Producto" %>
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
    <div class="row">
        <!-- Columna para el formulario -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center color1 text-white">
                    <h2>Registro de Producto</h2>
                </div>
                <div class="card-body">
                    <div class="container">
                        <div class="mb-3">
                            <asp:Label runat="server" Text="ID Producto" AssociatedControlID="txtIDProducto" />
                            <asp:TextBox runat="server" ID="txtIDProducto" CssClass="form-control" Enabled="false" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="Nombre del Producto" AssociatedControlID="txtNombreProducto" />
                            <asp:TextBox runat="server" ID="txtNombreProducto" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="Precio de Costo" AssociatedControlID="txtPrecioCosto" />
                            <asp:TextBox runat="server" ID="txtPrecioCosto" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="Precio de Venta" AssociatedControlID="txtPrecioVenta" />
                            <asp:TextBox runat="server" ID="txtPrecioVenta" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="Estado" AssociatedControlID="ddlEstado" />
                            <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control">
                                <asp:ListItem Text="Activo" Value="Activo" />
                                <asp:ListItem Text="Inactivo" Value="Inactivo" />
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="Categoría" AssociatedControlID="ddlCategoria" />
                            <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <div class="text-center">
                            <asp:Button runat="server" Text="Guardar" CssClass="btn btn-primary" />
                            <asp:Button runat="server" Text="Cancelar" CssClass="btn btn-secondary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Columna para el GridView -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center color1 text-white">
                    <h2>Listado de Productos</h2>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvProductos" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="ID_Producto" HeaderText="ID Producto" />
                            <asp:BoundField DataField="Nombre_Producto" HeaderText="Nombre del Producto" />
                            <asp:BoundField DataField="Precio_Costo" HeaderText="Precio Costo" />
                            <asp:BoundField DataField="Precio_Venta" HeaderText="Precio Venta" />
                            <asp:BoundField DataField="Estado" HeaderText="Estado" />
                            <asp:BoundField DataField="ID_Categoria" HeaderText="ID Categoría" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</div>

    <!--  -->
</asp:Content>
