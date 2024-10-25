<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="SmithInventory.PagesAdmin.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal text-body-emphasis">Modulo de Reportes</h1>
            <p class="fs-5 text-body-secondary">
                Bienvenido al Modulo de Reportes, en este apartado puedes visualizar los 
               distintos reportes que existen en tu Sistema.
            </p>
        </div>
    </div>
    <!-- Comienza el Apartado de Reportes -->
    <!-- Contenedor principal -->
    <div class="container py-4">
        <!-- Tarjeta para registrar lotes -->
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h2>Seleccione su Reporte</h2>
            </div>
            <!-- DrowDownList de Reportes -->
            <div class="card-body">
                <div class="form-group">
                    <asp:DropDownList ID="ddlReportes" AutoPostBack="true" OnTextChanged="ddlReportes_SelectedIndexChanged" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <!-- Gridview para ver Reportes -->
            <div class="card-body table-responsive">
                <asp:TextBox ID="TextBoxBuscar" CssClass="form-control" runat="server"></asp:TextBox>
                <br />
                <asp:GridView ID="gvReportes" runat="server" CssClass="table table-bordered table-striped">
                </asp:GridView>
            </div>
            <!-- Boton para mandar a llamar PDF -->
            <div class="card-footer text-right">
                <asp:Button ID="btnEnviar" runat="server" CssClass="btn btn-primary" Text="Descargar  como PDF" OnClick="btnEnviar_Click" />
            </div>
            <!-- -->
        </div>
    </div>
</asp:Content>
