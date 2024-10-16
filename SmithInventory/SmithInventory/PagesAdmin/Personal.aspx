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
                                    <asp:Label runat="server" Text="Estado" AssociatedControlID="chkEstado" />
                                    <asp:CheckBox runat="server" ID="chkEstado" CssClass="form-check-input" />
                                </div>
                                <div class="mb-3">
                                    <asp:Label runat="server" Text="Fecha de Creación" AssociatedControlID="txtFechaCreacion" />
                                    <asp:TextBox runat="server" ID="txtFechaCreacion" CssClass="form-control" Enabled="false" />
                                </div>
                                <div class="text-center">
                                    <asp:Button ID="ButtonGuardarUser" runat="server" Text="Guardar Usuario" CssClass="btn btn-primary" OnClick="ButtonGuardarUser_Click" />
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
                            <asp:GridView ID="gvUsuarios" runat="server" CssClass="table table-bordered table-striped table-responsive" AutoGenerateColumns="False"
                                DataKeyNames="Id_Usuario"
                                OnRowEditing="gvUsuarios_RowEditing"
                                OnRowCancelingEdit="gvUsuarios_RowCancelingEdit"
                                OnRowUpdating="gvUsuarios_RowUpdating">
                                <Columns>
                                    <asp:BoundField DataField="id_Usuario" HeaderText="ID" ReadOnly="True" />

                                    <asp:TemplateField HeaderText="Usuario">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("Usuario1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtUsuario" runat="server" Text='<%# Bind("Usuario1") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Password">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPassword" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>' TextMode="Password"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Estado">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="chkEstadoEdit" runat="server" Checked='<%# Bind("Estado") %>' />
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Fecha Creacion">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFechaCreacion" runat="server" Text='<%# Bind("Fecha_Creacion", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtFechaCreacion" runat="server" Text='<%# Bind("Fecha_Creacion", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:CommandField ShowEditButton="True" ButtonType="Button" />
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
                                <asp:Button ID="ButtonGuardarPersonal" runat="server" Text="Guardar Personal" CssClass="btn btn-primary" OnClick="ButtonGuardarPersonal_Click" />
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
                            <asp:GridView ID="gvPersonal" runat="server" CssClass="table table-bordered table-responsive table-striped" AutoGenerateColumns="False"
                                DataKeyNames="id_Personal"
                                OnRowEditing="gvPersonal_RowEditing"
                                OnRowCancelingEdit="gvPersonal_RowCancelingEdit"
                                OnRowUpdating="gvPersonal_RowUpdating">
                                <Columns>
                                    <asp:BoundField DataField="id_Personal" HeaderText="ID" ReadOnly="True" />
                                    <asp:TemplateField HeaderText="Primer Nombre">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNombrePersonal" runat="server" Text='<%# Bind("Primer_Nombre") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtNombrePersonal" runat="server" Text='<%# Bind("Primer_Nombre") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Segundo Nombre">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSegundoNombrePersonal" runat="server" Text='<%# Bind("Segundo_Nombre") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtSegundoNombrePersonal" runat="server" Text='<%# Bind("Segundo_Nombre") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Primer Apellido">
                                        <ItemTemplate>
                                            <asp:Label ID="lblApellidoPersonal" runat="server" Text='<%# Bind("Primer_Apellido") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtApellidoPersonal" runat="server" Text='<%# Bind("Primer_Apellido") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Segundo Apellido">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSegundoApellidoPersonal" runat="server" Text='<%# Bind("Segundo_Apellido") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtSegundoApellidoPersonal" runat="server" Text='<%# Bind("Segundo_Apellido") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DPI">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDPI" runat="server" Text='<%# Bind("DPI") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDPI" runat="server" Text='<%# Bind("DPI") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Dirección">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDireccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDireccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Teléfono">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- MODALES -->
        <!-- Usuario -->
        <div id="messageBoxSuccessUser" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Usuario Creado correctamente.
        </div>
        <div id="messageBoxErrorUser" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Error al crear el Usuario.
        </div>
        <div id="messageBoxUpdateUser" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Usuario actualizado correctamente.
        </div>
        <!-- Scripts para mostrar los modales -->
        <script type="text/javascript">
            function showSuccessMessageProducto() {
                var messageBox = document.getElementById("messageBoxSuccessUser");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }

            function showErrorMessageProducto() {
                var messageBox = document.getElementById("messageBoxErrorUser");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }

            function showUpdateMessageProducto() {
                var messageBox = document.getElementById("messageBoxUpdateUser");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }
        </script>
        <!-- Personal -->
        <div id="messageBoxSuccessPersonal" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Personal Creado correctamente.
        </div>
        <div id="messageBoxErrorPersonal" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Error al crear al Personal.
        </div>
        <div id="messageBoxUpdatePersonal" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Personal actualizado correctamente.
        </div>
        <!-- Scripts para mostrar los modales -->
        <script type="text/javascript">
            function showSuccessMessageProducto() {
                var messageBox = document.getElementById("messageBoxSuccessPersonal");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }

            function showErrorMessageProducto() {
                var messageBox = document.getElementById("messageBoxErrorPersonal");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }

            function showUpdateMessageProducto() {
                var messageBox = document.getElementById("messageBoxUpdatePersonal");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }
        </script>
        <!-- -->
    </div>
</asp:Content>
