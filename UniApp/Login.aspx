<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UniApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>University Project</title>

    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <!-- <meta http-equiv="content-type" content="application/xhtml+xml; charset=iso-8859-1" /> -->
    <meta http-equiv="content-language" content="en" />

    <!-- Meta Page Info Section -->
    <meta charset="utf-8">
    <meta name="HandheldFriendly" content="True" />
    <meta name="MobileOptimized" content="320" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <meta name="author" content="Beerinder Chhina" />
    <meta name="revisit-after" content="2 weeks" />
    <meta name="distribution" content="global" />
    <meta name="rating" content="general" />
    <meta name="robots" content="all" />

    <!-- Style Sheets -->
    <link rel="stylesheet" type="text/css" media="all" href="/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" media="all" href="/css/Custom.css" />
    <!-- /Style Sheets -->

    <!-- Javascript Scripts -->
    <script src="/js/jquery.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
</head>
<body>
  
    <div>
      <div id="LoginPage">
        <div id="LoginDialog">
            <div style="height:20%;width:100%;border-bottom:1px dashed black; text-align:center;padding-top:10px;font-weight:bold;font-size:35px;">Login!</div>
       <div style="height:30%; width:100%;padding:8%;">
           <div style="float:left;width:40%;height:10%;font-size:25px;"> User Name : </div>
           <input id="LoginUserTextBox" style="height:30px;" type="text" value="" />
       </div>
             <div style="height:30%; width:100%;padding:8%;">
           <div style="float:left;width:40%;height:10%;font-size:25px;"> Password : </div>
           <input id="LoginUserPasswordTextBox" style="height:30px;font-size:20px;" type="Password" value=""/>
       </div>
             <input type="submit" class="SubmitButton btn btn-info LoginSubmit" style="width:100px;height:40px;color:black" value="Submit!">
             </div>
    </div>
    </div>
      <form id="form3" runat="server">
    </form>
</body>
</html>
