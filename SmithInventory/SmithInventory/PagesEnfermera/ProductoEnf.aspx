<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteEnfermera.Master" AutoEventWireup="true" CodeBehind="ProductoEnf.aspx.cs" Inherits="SmithInventory.PagesEnfermera.Producto" %>
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
                                <asp:Label runat="server" Text="Estado" AssociatedControlID="chkEstado" />
                                <asp:CheckBox runat="server" ID="chkEstado" CssClass="form-check-input" />
                            </div>
                            <div class="mb-3">
                                <asp:Label runat="server" Text="Categoría" AssociatedControlID="ddlCategoria" />
                                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="text-center">
                                <asp:Button ID="ButtonGuardarProducto" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="ButtonGuardarProducto_Click" />
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
                    <div class="card-body table-responsive">
                        <asp:GridView
                            ID="gvProducto"
                            runat="server"
                            AutoGenerateColumns="False"
                            DataKeyNames="ID_Producto"
                            AllowPaging="true" PageSize="8"
                            CssClass="table table-responsive table-striped table-bordered"
                            OnRowEditing="gvProducto_RowEditing"
                            OnPageIndexChanging="gvProducto_PageIndexChanging"
                            OnRowCancelingEdit="gvProducto_RowCancelingEdit"
                            OnRowUpdating="gvProducto_RowUpdating">
                            <Columns>
                                <asp:BoundField DataField="ID_Producto" HeaderText="ID" ReadOnly="True" />
                                <asp:TemplateField HeaderText="Nombre Producto">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNombreProducto" runat="server" Text='<%# Bind("Nombre_Producto") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nombre_Producto") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Precio Venta">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPrecio" runat="server" Text='<%# Bind("Precio_Venta") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPrecio" runat="server" Text='<%# Bind("Precio_Venta") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Precio Costo">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStock" runat="server" Text='<%# Bind("Precio_Costo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtStock" runat="server" Text='<%# Bind("Precio_Costo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Estado") %>' Enabled="false" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chkEstadoEdit" runat="server" Checked='<%# Bind("Estado") %>' />
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
    <!-- Modales -->
    <div id="messageBoxSuccessProducto" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Producto guardado correctamente.
    </div>
    <div id="messageBoxErrorProducto" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #eb0909; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Error al guardar el Producto.
    </div>
    <div id="messageBoxUpdateProducto" style="display: none; position: fixed; top: 60px; right: 20px; background-color: #4CAF50; color: white; padding: 10px; border-radius: 5px; z-index: 1000;">
        Producto actualizado correctamente.
    </div>
    <!-- Scripts para mostrar los modales -->
    <script type="text/javascript">
        function showSuccessMessageProducto() {
            var messageBox = document.getElementById("messageBoxSuccessProducto");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }

        function showErrorMessageProducto() {
            var messageBox = document.getElementById("messageBoxErrorProducto");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }

        function showUpdateMessageProducto() {
            var messageBox = document.getElementById("messageBoxUpdateProducto");
            messageBox.style.display = "block";
            setTimeout(function () {
                messageBox.style.display = "none";
            }, 3000); // Ocultar el mensaje después de 3 segundos
        }
    </script>
    <!--  -->
</asp:Content>
