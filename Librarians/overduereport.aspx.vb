
Partial Class Librarians_overduereport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim MaterialsOverDue As String

        MaterialsOverDue = "SELECT * FROM Rentals WHERE ReturnDate > CONVERT(datetime,CONVERT(varchar(10),GetDate(),112))"

        SqlDataSource1.SelectCommand = MaterialsOverDue
    End Sub
End Class
