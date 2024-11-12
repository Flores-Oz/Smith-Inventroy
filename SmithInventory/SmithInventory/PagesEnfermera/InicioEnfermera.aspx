<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteEnfermera.Master" AutoEventWireup="true" CodeBehind="InicioEnfermera.aspx.cs" Inherits="SmithInventory.PagesEnfermera.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal text-body-emphasis">Modulo de Enfermera</h1>
            <p class="fs-5 text-body-secondary">Bienvenido al Modulo de Enfermeras, en este apartado encontraras varias opciones para tu trabajo.</p>
        </div>
    </div>
    <!--  -->
    <div class="container py-4">
        <div style="border-top: 1px solid #ccc; margin: 20px 0;"></div>
        <div class="row align-items-md-stretch">
            <div class="col-md-6">
                <div class="h-100 p-5 text-bg-dark rounded-3">
                   <h2>Producto</h2>
                    <p>En este apartado puedes agregar/modificar productos al igual si deseas agregar/modificar Categorias de los mismos. Completa la información requerida para mantener un registro actualizado y asegurarte de que los datos sean correctos al momento de Ingresar.</p>
                    <button class="btn btn-outline-light" type="button">Ir a la Sección</button>
                </div>
            </div>
            <div class="col-md-6">
                <div class="h-100 p-5 text-bg-dark border rounded-3">
                    <h2>Reportes</h2>
                    <p>Apartado especifico para la visualizacion de reportes y exportacion de los mismos.</p>
                    <button class="btn btn-outline-secondary" type="button">Ir a la Sección</button>
                </div>
            </div>
        </div>
         <div style="border-top: 1px solid #ccc; margin: 20px 0;"></div>
 <div class="row align-items-md-stretch">
     <div class="col-md-6">
         <div class="h-100 p-5 text-bg-dark rounded-3">
             <h2>Ventas</h2>
             <p>En este apartado puedes realizar una Venta.</p>
             <button class="btn btn-outline-light" type="button">Ir a la Sección</button>
         </div>
     </div>
     <div class="col-md-6">
    <div class="h-100 p-5 text-bg-dark rounded-3">
        <h2>Lotes</h2>
        <p>En este apartado puedes realizar un Ingreso de Lotes.</p>
        <button class="btn btn-outline-light" type="button">Ir a la Sección</button>
    </div>
</div>
     </div>
    </div>
</asp:Content>
