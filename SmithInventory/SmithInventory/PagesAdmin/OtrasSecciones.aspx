<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="OtrasSecciones.aspx.cs" Inherits="SmithInventory.PagesAdmin.OtrasSecciones" %>

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
            <h1 class="display-4 fw-normal text-body-emphasis">Otras Secciones</h1>
            <p class="fs-5 text-body-secondary">En este modulo puedes agregar mas datos para nutrir o verificar datos para tu Sistema</p>
        </div>
    </div>
    <!--  -->
    <div class="container">
        <!-- Categoria -->
        <div class="container">
            <div class="row">
                <!-- Columna 1: Formulario Modal -->
                <div class="col-md-6">
                    <!-- Modal para el Formulario -->
                    <div class="modal modal-sheet position-static d-block p-4 py-md-5">
                        <div class="modal-dialog" role="document">
                            <div class="rounded-4 shadow bg-secundary">
                                <div class="modal-content color1">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-white">Categoria</h5>
                                    </div>
                                    <div class="modal-body">
                                        <div>
                                            <div class="mb-3">
                                                <label for="inputName" class="form-label text-white">Nombre Categoria</label>
                                                <asp:TextBox ID="TextBoxNombreCategoria" CssClass="form-control rounded-3" placeholder="Ingrese Categoria" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="mb-3">
                                                <label for="inputEmail" class="form-label text-white">Descripcion Categoria</label>
                                                <asp:TextBox ID="TextBoxDescripcionCat" CssClass="form-control rounded-3" placeholder="Ingrese una Descripcion(Puede quedar vacio)" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Button ID="ButtonGuardarCat" CssClass="btn btn-color btn-large" runat="server" Text="Guardar" OnClick="ButtonGuardarCat_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Columna 2: GridView Modal -->
                <div class="col-md-6">
                    <!-- Modal para el GridView -->
                    <div class="modal modal-sheet position-static d-block p-4 py-md-5">
                        <div class="modal-dialog" role="document">
                            <div class="rounded-4 shadow bg-secundary">
                                <div class="modal-content color1">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-white">Categorias Existentes</h5>
                                    </div>
                                    <div class="modal-body">
                                        <!---->
                                        <div class="d-flex justify-content-center align-items-center">
                                        </div>
                                        <div style="overflow-x: auto;">
                                            <asp:GridView ID="GridViewCategorias" runat="server"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="ID_Categoria"
                                                CssClass="table table-striped table-bordered table-responsive"
                                                AutoGenerateSelectButton="false" AllowPaging="true" PageSize="5"
                                                OnSelectedIndexChanged="GridViewCategorias_SelectedIndexChanged"
                                                OnPageIndexChanging="GridViewCategorias_PageIndexChanging"
                                                OnRowEditing="GridViewCategorias_RowEditing"
                                                OnRowCancelingEdit="GridViewCategorias_RowCancelingEdit"
                                                OnRowUpdating="GridViewCategorias_RowUpdating">
                                                <Columns>
                                                    <asp:BoundField DataField="ID_Categoria" HeaderText="ID" ReadOnly="True" />
                                                    <asp:TemplateField HeaderText="Nombre">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNombreCategoria" runat="server" Text='<%# Bind("Nombre_Categoria") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtNombreCategoria" runat="server" Text='<%# Bind("Nombre_Categoria") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripción">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDescripcionCategoria" runat="server" Text='<%# Bind("Descripcion_Categoria") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtDescripcionCategoria" runat="server" Text='<%# Bind("Descripcion_Categoria") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <!---->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  -->
        <!-- Casa Farmaceutica -->
        <div class="container">
            <div class="row">
                <!-- Columna 1: Formulario Modal -->
                <div class="col-md-6">
                    <!-- Modal para el Formulario -->
                    <div class="modal modal-sheet position-static d-block p-4 py-md-5">
                        <div class="modal-dialog" role="document">
                            <div class="rounded-4 shadow bg-secundary">
                                <div class="modal-content color1">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-white">Casa Farmaceutica</h5>
                                    </div>
                                    <div class="modal-body">
                                        <div>
                                            <div class="mb-3">
                                                <label for="inputName" class="form-label text-white">Casa Farmaceutica</label>
                                                <asp:TextBox ID="TextBoxCasaFarm" CssClass="form-control rounded-3" placeholder="Ingrese Casa Farmaceutica" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="mb-3">
                                                <label for="inputEmail" class="form-label text-white">Descripcion Casa Farmaceutica</label>
                                                <asp:TextBox ID="TextBoxDetalleFarm" CssClass="form-control rounded-3" placeholder="Ingrese una Descripcion(Puede quedar vacio)" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Button ID="ButtonGuardarFarm" CssClass="btn btn-color btn-large" runat="server" Text="Guardar" OnClick="ButtonGuardarFarm_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Columna 2: GridView Modal -->
                <div class="col-md-6">
                    <!-- Modal para el GridView -->
                    <div class="modal modal-sheet position-static d-block p-4 py-md-5">
                        <div class="modal-dialog" role="document">
                            <div class="rounded-4 shadow bg-secundary">
                                <div class="modal-content color1">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-white">Casas Farmaceuticas Existentes</h5>
                                    </div>
                                    <div class="modal-body">
                                        <!---->
                                        <div class="d-flex justify-content-center align-items-center">
                                        </div>
                                        <div style="overflow-x: auto;">
                                            <asp:GridView ID="GridViewCasaFarmaceutica" runat="server"
                                                CssClass="table table-striped table-bordered table-responsive"
                                                AutoGenerateSelectButton="false" AllowPaging="true" PageSize="5" AutoGenerateColumns="false"
                                                OnSelectedIndexChanged="GridViewCasaFarmaceutica_SelectedIndexChanged"
                                                OnPageIndexChanging="GridViewCasaFarmaceutica_PageIndexChanging"
                                                OnRowEditing="GridViewCasaFarmaceutica_RowEditing"
                                                OnRowCancelingEdit="GridViewCasaFarmaceutica_RowCancelingEdit"
                                                OnRowUpdating="GridViewCasaFarmaceutica_RowUpdating"
                                                DataKeyNames="ID_CasaFarmaceutica">
                                                <Columns>
                                                    <asp:BoundField DataField="ID_CasaFarmaceutica" HeaderText="ID" ReadOnly="True" />
                                                    <asp:TemplateField HeaderText="Casa Farmaceutica">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCasaFarmaceutica" runat="server" Text='<%# Bind("Casa_Farmaceutica1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtCasaFarmaceutica" runat="server" Text='<%# Bind("Casa_Farmaceutica1") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Detalle">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDetalle" runat="server" Text='<%# Bind("Detalle") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtDetalle" runat="server" Text='<%# Bind("Detalle") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <!---->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  -->
        <!-- Rol -->
        <div class="container">
            <div class="row">
                <!-- Columna 1: Formulario Modal -->
                <div class="col-md-6">
                    <!-- Modal para el Formulario -->
                    <div class="modal modal-sheet position-static d-block p-4 py-md-5">
                        <div class="modal-dialog" role="document">
                            <div class="rounded-4 shadow bg-secundary">
                                <div class="modal-content color1">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-white">Rol</h5>
                                    </div>
                                    <div class="modal-body">
                                        <div>
                                            <div class="mb-3">
                                                <label for="inputName" class="form-label text-white">Permiso</label>
                                                <asp:TextBox ID="TextBoxRol" CssClass="form-control rounded-3" placeholder="Ingrese Rol" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="mb-3">
                                                <label for="inputEmail" class="form-label text-white">Descripcion Rol</label>
                                                <asp:TextBox ID="TextBoxDescripcionRol" CssClass="form-control rounded-3" placeholder="Ingrese una Descripcion(Puede quedar vacio)" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Button ID="ButtonGuardarRol" CssClass="btn btn-color btn-large" runat="server" Text="Guardar" OnClick="ButtonGuardarRol_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Columna 2: GridView Modal -->
                <div class="col-md-6">
                    <!-- Modal para el GridView -->
                    <div class="modal modal-sheet position-static d-block p-4 py-md-5">
                        <div class="modal-dialog" role="document">
                            <div class="rounded-4 shadow bg-secundary">
                                <div class="modal-content color1">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-white">Roles Existentes</h5>
                                    </div>
                                    <div class="modal-body">
                                        <!---->
                                        <div class="d-flex justify-content-center align-items-center">
                                        </div>
                                        <div style="overflow-x: auto;">
                                            <asp:GridView ID="GridViewRoles" runat="server" AutoGenerateColumns="false"
                                                CssClass="table table-striped table-bordered table-responsive"
                                                AutoGenerateSelectButton="false" AllowPaging="true" PageSize="5"
                                                OnSelectedIndexChanged="GridViewRoles_SelectedIndexChanged"
                                                OnPageIndexChanging="GridViewRoles_PageIndexChanging"
                                                OnRowEditing="GridViewRoles_RowEditing"
                                                OnRowCancelingEdit="GridViewRoles_RowCancelingEdit"
                                                OnRowUpdating="GridViewRoles_RowUpdating"
                                                DataKeyNames="id_Rol">
                                                <Columns>
                                                    <asp:BoundField DataField="ID_Rol" HeaderText="ID" ReadOnly="True" />
                                                    <asp:TemplateField HeaderText="Permiso">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPermiso" runat="server" Text='<%# Bind("Permiso") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtPermiso" runat="server" Text='<%# Bind("Permiso") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripción">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDescripcionRol" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtDescripcionRol" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <!---->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  -->
        <!-- Tipo Cliente -->
        <div class="container">
            <div class="row">
                <!-- Columna 1: Formulario Modal -->
                <div class="col-md-6">
                    <!-- Modal para el Formulario -->
                    <div class="modal modal-sheet position-static d-block p-4 py-md-5">
                        <div class="modal-dialog" role="document">
                            <div class="rounded-4 shadow bg-secundary">
                                <div class="modal-content color1">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-white">Tipo Cliente</h5>
                                    </div>
                                    <div class="modal-body">
                                        <div>
                                            <div class="mb-3">
                                                <label for="inputName" class="form-label text-white">Tipo Cliente</label>
                                                <asp:TextBox ID="TextBoxTipoCliente" CssClass="form-control rounded-3" placeholder="Ingrese Tipo Cliente" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Button ID="ButtonGuardarTipo" CssClass="btn btn-color btn-large" runat="server" Text="Guardar" OnClick="ButtonGuardarTipo_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Columna 2: GridView Modal -->
                <div class="col-md-6">
                    <!-- Modal para el GridView -->
                    <div class="modal modal-sheet position-static d-block p-4 py-md-5">
                        <div class="modal-dialog" role="document">
                            <div class="rounded-4 shadow bg-secundary">
                                <div class="modal-content color1">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-white">Clientes Existentes</h5>
                                    </div>
                                    <div class="modal-body">
                                        <!---->
                                        <div class="d-flex justify-content-center align-items-center">
                                        </div>
                                        <div style="overflow-x: auto;">
                                            <asp:GridView ID="GridViewTipoCliente" runat="server"
                                                CssClass="table table-striped table-bordered table-responsive"
                                                AutoGenerateSelectButton="false" AutoGenerateColumns="false"
                                                AllowPaging="true" PageSize="5"
                                                OnSelectedIndexChanged="GridViewTipoCliente_SelectedIndexChanged"
                                                OnPageIndexChanging="GridViewTipoCliente_PageIndexChanging"
                                                OnRowEditing="GridViewTipoCliente_RowEditing"
                                                OnRowCancelingEdit="GridViewTipoCliente_RowCancelingEdit"
                                                OnRowUpdating="GridViewTipoCliente_RowUpdating"
                                                DataKeyNames="id_Tipo">
                                                <Columns>
                                                    <asp:BoundField DataField="id_Tipo" HeaderText="ID" ReadOnly="True" />
                                                    <asp:TemplateField HeaderText="Tipo Cliente">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTipoCliente" runat="server" Text='<%# Bind("Tipo_Cliente1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTipoCliente" runat="server" Text='<%# Bind("Tipo_Cliente1") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <!---->
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--  -->
            <!-- Estados -->
            <div class="container">
                <div class="row">
                    <!-- Columna 1: Formulario Modal -->
                    <div class="col-md-6">
                        <!-- Modal para el Formulario -->
                        <div class="modal modal-sheet position-static d-block p-4 py-md-5">
                            <div class="modal-dialog" role="document">
                                <div class="rounded-4 shadow bg-secundary">
                                    <div class="modal-content color1">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-white">Estados</h5>
                                        </div>
                                        <div class="modal-body">
                                            <div>
                                                <div class="mb-3">
                                                    <label for="inputName" class="form-label text-white">Estados</label>
                                                    <asp:TextBox ID="TextBoxEstado" CssClass="form-control rounded-3" placeholder="Ingrese Estado" runat="server"></asp:TextBox>
                                                </div>
                                                <asp:Button ID="ButtonGuardarEstado" CssClass="btn btn-color btn-large" runat="server" Text="Guardar" OnClick="ButtonGuardarEstado_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Columna 2: GridView Modal -->
                    <div class="col-md-6">
                        <!-- Modal para el GridView -->
                        <div class="modal modal-sheet position-static d-block p-4 py-md-5">
                            <div class="modal-dialog" role="document">
                                <div class="rounded-4 shadow bg-secundary">
                                    <div class="modal-content color1">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-white">Estados Existentes</h5>
                                        </div>
                                        <div class="modal-body">
                                            <!---->
                                            <div class="d-flex justify-content-center align-items-center">
                                            </div>
                                            <div style="overflow-x: auto;">
                                                <asp:GridView ID="GridViewEstados" runat="server"
                                                    CssClass="table table-striped table-bordered table-responsive"
                                                    AutoGenerateSelectButton="false" AutoGenerateColumns="false"
                                                    AllowPaging="true" PageSize="5"
                                                    OnSelectedIndexChanged="GridViewEstados_SelectedIndexChanged"
                                                    OnPageIndexChanging="GridViewEstados_PageIndexChanging"
                                                    OnRowEditing="GridViewEstados_RowEditing"
                                                    OnRowCancelingEdit="GridViewEstados_RowCancelingEdit"
                                                    OnRowUpdating="GridViewEstados_RowUpdating"
                                                    DataKeyNames="id_Estado">
                                                    <Columns>
                                                        <asp:BoundField DataField="ID_Estado" HeaderText="ID" ReadOnly="True" />
                                                        <asp:TemplateField HeaderText="Estado">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtEstado" runat="server" Text='<%# Bind("Estado") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                            <!---->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modals  -->
        <!-- Modales -->
        <div id="messageBoxSuccess" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Categoría guardada correctamente.
        </div>
        <div id="messageBoxError" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Error al guardar la categoría.
        </div>
        <div id="messageBoxUpdate" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Categoría actualizada correctamente.
        </div>
        <!-- Scripts para mostrar los modales -->
        <script type="text/javascript">
            function showSuccessMessage() {
                var messageBox = document.getElementById("messageBoxSuccess");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }

            function showErrorMessage() {
                var messageBox = document.getElementById("messageBoxError");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }

            function showUpdateMessage() {
                var messageBox = document.getElementById("messageBoxUpdate");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }
        </script>
        <!-- Modales para Rol -->
        <div id="messageBoxRolSuccess" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Rol guardado correctamente.
        </div>
        <div id="messageBoxRolError" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Error al guardar el rol. Verifique los datos ingresados.
        </div>
        <div id="messageBoxRolUpdate" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Rol guardado correctamente.
        </div>

        <!-- Scripts -->
        <script type="text/javascript">
            function showSuccessMessageRol() {
                var messageBox = document.getElementById("messageBoxRolSuccess");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }

            function showErrorMessageRol() {
                var messageBox = document.getElementById("messageBoxRolError");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }

            function showUpdateMessageRol() {
                var messageBox = document.getElementById("messageBoxRolUpdate");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }
        </script>
        <!-- Modales para Tipo Cliente -->
        <div id="messageBoxTipoClienteSuccess" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Tipo de Cliente guardado correctamente.
        </div>
        <div id="messageBoxTipoClienteError" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Error al guardar el Tipo de Cliente. Verifique los datos ingresados.
        </div>
        <div id="messageBoxTipoClienteUpdate" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Tipo de Cliente actualizado correctamente.
        </div>
        <!-- Scripts -->
        <script type="text/javascript">
            function showSuccessMessageTipoCliente() {
                var messageBox = document.getElementById("messageBoxTipoClienteSuccess");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }

            function showErrorMessageTipoCliente() {
                var messageBox = document.getElementById("messageBoxTipoClienteError");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }
            function showUpdateMessageTipoCliente() {
                var messageBox = document.getElementById("messageBoxTipoClienteUpdate");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }
        </script>
        <!-- Modales para CasaFarmaceutica -->
        <div id="messageBoxCasaFarmaceuticaSuccess" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Casa Farmaceutica guardada correctamente.
        </div>
        <div id="messageBoxCasaFarmaceuticaError" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Error al guardar la Casa Farmaceutica. Verifique los datos ingresados.
        </div>
        <div id="messageBoxCasaFarmaceuticaUpdate" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Casa Farmaceutica actualizado correctamente.
        </div>
        <!-- Scripts -->
        <script type="text/javascript">
            function showSuccessMessageCasaFarmaceutica() {
                var messageBox = document.getElementById("messageBoxCasaFarmaceuticaSuccess");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }

            function showErrorMessageCasaFarmaceutica() {
                var messageBox = document.getElementById("messageBoxCasaFarmaceuticaError");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }
            function showUpdateMessageCasaFarmaceutica() {
                var messageBox = document.getElementById("messageBoxCasaFarmaceuticaUpdate");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }
        </script>
        <!-- Modales para Estado -->
        <div id="messageBoxEstadoSuccess" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Estado guardado correctamente.
        </div>
        <div id="messageBoxEstadoError" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Error al guardar el Estado. Verifique los datos ingresados.
        </div>
        <div id="messageBoxEstadoUpdate" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
            Estado actualizado correctamente.
        </div>
        <!-- Scripts -->
        <script type="text/javascript">
            function showSuccessMessageEstado() {
                var messageBox = document.getElementById("messageBoxEstadoSuccess");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }

            function showErrorMessageEstado() {
                var messageBox = document.getElementById("messageBoxEstadoError");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }
            function showUpdateMessageEstado() {
                var messageBox = document.getElementById("messageBoxEstadoUpdate");
                messageBox.style.display = "block";
                setTimeout(function () {
                    messageBox.style.display = "none";
                }, 3000); // Ocultar el mensaje después de 3 segundos
            }
        </script>

        <!--  -->
    </div>
</asp:Content>
