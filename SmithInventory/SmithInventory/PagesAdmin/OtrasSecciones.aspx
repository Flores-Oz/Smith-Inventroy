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
                                            <asp:Button ID="ButtonGuardarCat" CssClass="btn btn-color btn-large" runat="server" Text="Guardar" OnClick="ButtonGuardarCat_Click"/>
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
                                                AutoGenerateSelectButton="true" AllowPaging="true" PageSize="5" 
                                                OnSelectedIndexChanged="GridViewCategorias_SelectedIndexChanged"
                                                OnPageIndexChanging="GridViewCategorias_PageIndexChanging"
                                                OnRowEditing="GridViewCategorias_RowEditing"
    OnRowCancelingEdit="GridViewCategorias_RowCancelingEdit"
    OnRowUpdating="GridViewCategorias_RowUpdating"
                                                >
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
                                                <label for="inputEmail" class="form-label text-white">Descripcion Categoria</label>
                                                <asp:TextBox ID="TextBoxDetalleFarm" CssClass="form-control rounded-3" placeholder="Ingrese una Descripcion(Puede quedar vacio)" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Button ID="ButtonGuardarFarm" CssClass="btn btn-color btn-large" runat="server" Text="Guardar" />
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
                                                AutoGenerateSelectButton="true" AllowPaging="true" PageSize="5" 
                                                OnSelectedIndexChanged="GridViewCasaFarmaceutica_SelectedIndexChanged"
                                                OnPageIndexChanging="GridViewCasaFarmaceutica_PageIndexChanging"
                                                OnRowEditing="GridViewCasaFarmaceutica_RowEditing"
    OnRowCancelingEdit="GridViewCasaFarmaceutica_RowCancelingEdit"
    OnRowUpdating="GridViewCasaFarmaceutica_RowUpdating">
                                                <Columns>
        <asp:BoundField DataField="ID_CasaFarmaceutica" HeaderText="ID" ReadOnly="True" />
        <asp:TemplateField HeaderText="Casa Farmaceutica">
            <ItemTemplate>
                <asp:Label ID="lblCasaFarmaceutica" runat="server" Text='<%# Bind("Casa_Farmaceutica") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtCasaFarmaceutica" runat="server" Text='<%# Bind("Casa_Farmaceutica") %>'></asp:TextBox>
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
                                            <asp:Button ID="ButtonGuardarRol" CssClass="btn btn-color btn-large" runat="server" Text="Guardar" />
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
                                            <asp:GridView ID="GridViewRoles" runat="server"
                                                 CssClass="table table-striped table-bordered table-responsive"
                                                AutoGenerateSelectButton="true" AllowPaging="true" PageSize="5" 
                                                OnSelectedIndexChanged="GridViewRoles_SelectedIndexChanged"
                                                OnPageIndexChanging="GridViewRoles_PageIndexChanging"
                                                OnRowEditing="GridViewRoles_RowEditing"
    OnRowCancelingEdit="GridViewRoles_RowCancelingEdit"
    OnRowUpdating="GridViewRoles_RowUpdating">
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
                                                <asp:TextBox ID="TextBox5" CssClass="form-control rounded-3" placeholder="Ingrese Tipo Cliente" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Button ID="ButtonGuardarTipo" CssClass="btn btn-color btn-large" runat="server" Text="Guardar" />
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
                                                AutoGenerateSelectButton="true" 
                                                 AllowPaging="true" PageSize="5" 
                                                OnSelectedIndexChanged="GridViewTipoCliente_SelectedIndexChanged"
                                                OnPageIndexChanging="GridViewTipoCliente_PageIndexChanging"
                                                OnRowEditing="GridViewTipoCliente_RowEditing"
    OnRowCancelingEdit="GridViewTipoCliente_RowCancelingEdit"
    OnRowUpdating="GridViewTipoCliente_RowUpdating">
                                                 <Columns>
        <asp:BoundField DataField="ID_Tipo" HeaderText="ID" ReadOnly="True" />
        <asp:TemplateField HeaderText="Tipo Cliente">
            <ItemTemplate>
                <asp:Label ID="lblTipoCliente" runat="server" Text='<%# Bind("Tipo_Cliente") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtTipoCliente" runat="server" Text='<%# Bind("Tipo_Cliente") %>'></asp:TextBox>
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
                                                <asp:TextBox ID="TextBox7" CssClass="form-control rounded-3" placeholder="Ingrese Estado" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Button ID="ButtonGuardarEstado" CssClass="btn btn-color btn-large" runat="server" Text="Guardar" />
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
                                                AutoGenerateSelectButton="true" 
                                                 AllowPaging="true" PageSize="5" 
                                                OnSelectedIndexChanged="GridViewEstados_SelectedIndexChanged"
                                                OnPageIndexChanging="GridViewEstados_PageIndexChanging"
                                                OnRowEditing="GridViewEstados_RowEditing"
    OnRowCancelingEdit="GridViewEstados_RowCancelingEdit"
    OnRowUpdating="GridViewEstados_RowUpdating">
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
        <!--  -->
    </div>
</asp:Content>
