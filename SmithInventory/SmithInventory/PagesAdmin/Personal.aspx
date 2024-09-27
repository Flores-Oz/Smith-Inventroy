<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="SmithInventory.PagesAdmin.Personal" %>

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
            <h1 class="display-4 fw-normal text-body-emphasis">Modulo de Usuario/Personal</h1>
            <p class="fs-5 text-body-secondary">Bienvenido al Modulo de Usuario/Personal, en este apartado puedes administrar tus usuarios y personal</p>
        </div>
    </div>
    <!--  -->
    <div class="container py-4">
        <!-- -->
<<div class="container mt-5">
    <!-- Fila para Usuario (Formulario y GridView) -->
    <div class="row mb-5">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header text-center color1 text-white">
                    <h2>Registro de Usuario</h2>
                </div>
                <div class="card-body">
                    <div class="container">
                        <!-- Campos del formulario para la tabla Usuario -->
                        <div class="mb-3">
                            <asp:Label runat="server" Text="ID Usuario" AssociatedControlID="txtIDUsuario" />
                            <asp:TextBox runat="server" ID="txtIDUsuario" CssClass="form-control" Enabled="false" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="Nombre de Usuario" AssociatedControlID="txtUsuario" />
                            <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="Contraseña" AssociatedControlID="txtPassword" />
                            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="Estado" AssociatedControlID="txtEstado" />
                            <asp:TextBox runat="server" ID="txtEstado" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" Text="Fecha de Creación" AssociatedControlID="txtFechaCreacion" />
                            <asp:TextBox runat="server" ID="txtFechaCreacion" CssClass="form-control" Enabled="false" />
                        </div>
                        <div class="text-center">
                            <asp:Button runat="server" Text="Guardar Usuario" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- GridView de Usuario -->
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header text-center color1 text-white">
                    <h2>Listado de Usuarios</h2>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvUsuarios" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="id_Usuario" HeaderText="ID Usuario" />
                            <asp:BoundField DataField="Usuario" HeaderText="Usuario" />
                            <asp:BoundField DataField="Estado" HeaderText="Estado" />
                            <asp:BoundField DataField="Fecha_Creacion" HeaderText="Fecha de Creación" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <!-- Fila para Personal (Formulario y GridView) -->
    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header text-center text-white color1">
                    <h2>Registro de Personal</h2>
                </div>
                <div class="card-body">
                    <!-- Campos del formulario para la tabla Personal -->
                    <div class="mb-3">
                        <asp:Label runat="server" Text="ID Personal" AssociatedControlID="txtIDPersonal" />
                        <asp:TextBox runat="server" ID="txtIDPersonal" CssClass="form-control" Enabled="false" />
                    </div>
                    <div class="mb-3">
                        <asp:Label runat="server" Text="DPI" AssociatedControlID="txtDPI" />
                        <asp:TextBox runat="server" ID="txtDPI" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <asp:Label runat="server" Text="Primer Nombre" AssociatedControlID="txtPrimerNombre" />
                        <asp:TextBox runat="server" ID="txtPrimerNombre" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <asp:Label runat="server" Text="Segundo Nombre" AssociatedControlID="txtSegundoNombre" />
                        <asp:TextBox runat="server" ID="txtSegundoNombre" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <asp:Label runat="server" Text="Primer Apellido" AssociatedControlID="txtPrimerApellido" />
                        <asp:TextBox runat="server" ID="txtPrimerApellido" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <asp:Label runat="server" Text="Segundo Apellido" AssociatedControlID="txtSegundoApellido" />
                        <asp:TextBox runat="server" ID="txtSegundoApellido" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <asp:Label runat="server" Text="Dirección" AssociatedControlID="txtDireccion" />
                        <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <asp:Label runat="server" Text="Teléfono" AssociatedControlID="txtTelefono" />
                        <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" />
                    </div>
                    <div class="text-center">
                        <asp:Button runat="server" Text="Guardar Personal" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>

        <!-- GridView de Personal -->
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header text-center color1 text-white">
                    <h2>Listado de Personal</h2>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvPersonal" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="id_Personal" HeaderText="ID Personal" />
                            <asp:BoundField DataField="DPI" HeaderText="DPI" />
                            <asp:BoundField DataField="Primer_Nombre" HeaderText="Primer Nombre" />
                            <asp:BoundField DataField="Segundo_Nombre" HeaderText="Segundo Nombre" />
                            <asp:BoundField DataField="Primer_Apellido" HeaderText="Primer Apellido" />
                            <asp:BoundField DataField="Segundo_Apellido" HeaderText="Segundo Apellido" />
                            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</div>

        <!-- -->
    </div>
</asp:Content>
