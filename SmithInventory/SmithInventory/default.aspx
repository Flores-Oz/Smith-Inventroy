<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SmithInventory._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <title>Login</title>
     <link rel="stylesheet" href="CSS/StyleIndex.css"/> 
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="vh-100">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6 text-black">

                            <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

                                <div style="width: 23rem;">

                                    <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Login</h3>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="TextBoxUsuario" placeholder="Usuario" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="TextBoxPass" TextMode="Password" placeholder="Contraseña" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                                    </div>

                                    <div class="pt-1 mb-4">
                                        <asp:Button ID="ButtonLogin" OnClick="ButtonLogin_Click" CssClass="btn btn-outline-success btn-lg btn-block" runat="server" Text="Iniciar sesión" />
                                    </div>

                                </div>

                            </div>

                        </div>
                        <div class="col-sm-6 px-0 d-none d-sm-block">
                            <img src="https://m.media-amazon.com/images/I/81QorhQkyoL._UF1000,1000_QL80_.jpg"
                                alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;" />
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
