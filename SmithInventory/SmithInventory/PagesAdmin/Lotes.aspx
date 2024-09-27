<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Lotes.aspx.cs" Inherits="SmithInventory.PagesAdmin.Lotes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal text-body-emphasis">Modulo de Usuario/Personal</h1>
            <p class="fs-5 text-body-secondary">Bienvenido al Modulo de Usuario/Personal, en este apartado puedes administrar tus usuarios y personal</p>
        </div>
    </div>
      <!--  -->
     <div class="container py-4">
        <!-- -->
        <div class="container mt-5">
  <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header text-center">
                    <h2>Registro de Lotes</h2>
                </div>
                <div class="card-body">
                    <div runat="server">
                        <!-- Campos del formulario para la tabla Lote_Ingreso -->
                        <div class="mb-3">
                            <asp:Label runat="server" Text="ID Lote" AssociatedControlID="txtIDLote" />
                            <asp:TextBox runat="server" ID="txtIDLote" CssClass="form-control" Enabled="false" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="ID Casa Farmaceutica" AssociatedControlID="txtCasaFarmaceutica" />
                            <asp:TextBox runat="server" ID="txtCasaFarmaceutica" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="Fecha de Ingreso" AssociatedControlID="txtFechaIngreso" />
                            <asp:TextBox runat="server" ID="txtFechaIngreso" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="Total Lote" AssociatedControlID="txtTotalLote" />
                            <asp:TextBox runat="server" ID="txtTotalLote" CssClass="form-control" />
                        </div>
                        <div class="text-center">
                            <asp:Button runat="server" Text="Guardar Lote" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- GridView de Lotes -->
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header text-center">
                    <h2>Listado de Lotes</h2>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvLotes" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="id_Lote" HeaderText="ID Lote" />
                            <asp:BoundField DataField="id_CasaFarmaceutica" HeaderText="ID Casa Farmaceutica" />
                            <asp:BoundField DataField="Fecha_Ingreso" HeaderText="Fecha de Ingreso" />
                            <asp:BoundField DataField="Total_Lote" HeaderText="Total Lote" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</div>
            </div>


</asp:Content>
