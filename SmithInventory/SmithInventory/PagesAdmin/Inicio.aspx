<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="SmithInventory.PagesAdmin.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal text-body-emphasis">Modulo de Administracion</h1>
            <p class="fs-5 text-body-secondary">Bienvenido al Modulo de Administrador, en este apartado encontraras varias opciones para tu sistema</p>
        </div>
    </div>
    <!--  -->
    <div class="container py-4">
     <div class="row align-items-md-stretch">
      <div class="col-md-6">
        <div class="h-100 p-5 text-bg-dark rounded-3">
          <h2>Producto</h2>
          <p>En este apartado puedes agregar nuevos productos al inventario. Completa la información requerida para mantener un registro actualizado y asegurarte de que haya suficiente stock disponible para los clientes.</p>
          <button class="btn btn-outline-light" type="button">Ir a la Sección</button>
        </div>
      </div>
      <div class="col-md-6">
        <div class="h-100 p-5 text-bg-dark border rounded-3">
          <h2>Personal</h2>
          <p>En este apartado puedes ingresar a nuevo personal o editar el ya existente, ademas de crear las creedenciales de ingreso para el nuevo personal agregado</p>
          <button class="btn btn-outline-secondary" type="button">Ir a la Sección</button>
        </div>
      </div>
    </div>
<div style="border-top: 1px solid #ccc; margin: 20px 0;"></div>     <div class="row align-items-md-stretch">
      <div class="col-md-6">
        <div class="h-100 p-5 text-bg-dark rounded-3">
          <h2>Otras Secciones</h2>
          <p>En este apartado encontraras diferentes formularios aparte, que pueden ser de utilidad.</p>
          <button class="btn btn-outline-light" type="button">Ir a la Sección</button>
        </div>
      </div>
      <div class="col-md-6">
        <div class="h-100 p-5 text-bg-dark border rounded-3">
          <h2>Reportes</h2>
          <p>Apartado especifico para la visualizacion de reportes y exportacion de los mismos para un analisis mas detallado.</p>
          <button class="btn btn-outline-secondary" type="button">Ir a la Sección</button>
        </div>
      </div>
    </div>
        </div>
</asp:Content>
