
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (Request.Browser.ScreenPixelsHeight <= 480 And Request.Browser.ScreenPixelsWidth <= 320) Then

            Response.Redirect("./Mobile/Default.aspx")
        End If

    End Sub
End Class
