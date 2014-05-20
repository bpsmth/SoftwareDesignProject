
Partial Class library
    Inherits System.Web.UI.MasterPage
  
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        datelb.Text = DateTime.Now.ToLongDateString
    End Sub

    
End Class

