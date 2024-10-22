﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Lotes.aspx.cs" Inherits="SmithInventory.PagesAdmin.Lotes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal text-body-emphasis">Modulo de Lote</h1>
            <p class="fs-5 text-body-secondary">Bienvenido al Modulo de Lote, en este apartado puedes registrar un nuevo lote y agregar productos al mismo.</p>
        </div>
    </div>

    <!-- Contenedor principal -->
    <div class="container py-4">
        <!-- Tarjeta para registrar lotes -->
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h2>Registrar Lote</h2>
            </div>
            <div class="card-body">
                <!-- Sección de datos del lote -->
                <div class="form-group">
                    <label for="txtIDLote">ID Lote:</label>
                    <asp:TextBox ID="txtIDLote" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtCasaFarmaceutica">Casa Farmacéutica:</label>
                    <asp:DropDownList ID="DropDownListCasaFarma" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="txtFechaIngreso">Fecha de Ingreso:</label>
                    <asp:TextBox ID="txtFechaIngreso" runat="server" CssClass="form-control" Type="date"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtTotalLote">Total del Lote:</label>
                    <asp:TextBox ID="txtTotalLote" runat="server" AutoPostBack="true" OnTextChanged="txtTotalLote_TextChanged" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>

                <!-- Sección de productos -->
                <div class="form-group">
                    <h4>Agregar Productos al Lote</h4>
                    <table class="table table-bordered" id="tablaProductosLote">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                                <th>Descuento</th>
                                <th>Subtotal</th>
                                <th>Fecha de Caducidad</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlProductoLote" runat="server" AutoPostBack="true" OnTextChanged="ddlProductoLote_TextChanged" CssClass="form-control"></asp:DropDownList>
                                </td>
                                <td><asp:TextBox ID="txtCantidadLote" AutoPostBack="true" OnTextChanged="txtCantidadLote_TextChanged" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td><asp:TextBox ID="txtPrecioLote" runat="server" Enabled="false" CssClass="form-control" ReadOnly="true"></asp:TextBox></td>
                                <td><asp:TextBox ID="txtDescuentoLote" AutoPostBack="true" OnTextChanged="txtDescuentoLote_TextChanged" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td><asp:TextBox ID="txtSubtotalLote" runat="server" Enabled="false" CssClass="form-control" OnTextChanged="txtSubtotalLote_TextChanged" ReadOnly="true"></asp:TextBox></td>
                                <td><asp:TextBox ID="txtFechaCaducidadLote" runat="server" CssClass="form-control" Type="date"></asp:TextBox></td>
                                <td>
                                    <asp:Button ID="btnAgregarProductoLote" OnClick="btnAgregarProductoLote_Click" runat="server" CssClass="btn btn-success" Text="Agregar" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- GridView para productos agregados -->
            <div class="card-body">
                <asp:GridView ID="gvProductosLote" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" OnRowCommand="gvProductosLote_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Producto" HeaderText="Producto" />
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" />
                        <asp:BoundField DataField="Descuento" HeaderText="Descuento" />
                        <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" />
                        <asp:BoundField DataField="FechaCaducidad" HeaderText="Fecha de Caducidad" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                   <asp:Button runat="server" ID="btnEliminarProducto" Text="Eliminar" CssClass="btn btn-danger" CommandName="Eliminar" CommandArgument='<%# Eval("ProductoID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="card-footer text-right">
                <asp:Button ID="btnGuardarLote" runat="server" CssClass="btn btn-primary" OnClick="btnGuardarLote_Click" Text="Guardar Lote" />
            </div>
        </div>
    </div>
</asp:Content>
