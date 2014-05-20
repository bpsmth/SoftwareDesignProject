Imports System.Data.SqlClient

Partial Class Librarians_rental
    Inherits System.Web.UI.Page

    Protected Sub btn_Rent_Click(sender As Object, e As EventArgs) Handles btn_Rent.Click

        Dim strISBN As String = tb_ISBN.Text
        Dim strUserName As String = tb_UserName.Text
        Dim CheckOutDate As DateTime = DateTime.Now
        Dim ReturnDate As DateTime = DateAdd("d", 30, Today)

        Dim sqlConn As New SqlConnection(ConfigurationManager.ConnectionStrings("cs_SLPL1").ConnectionString)
        Dim sqlAdp As New SqlDataAdapter
        Dim sqlCmd As New SqlCommand

        sqlCmd.Connection = sqlConn
        sqlCmd.CommandText = "sp_RentMaterial"
        sqlCmd.CommandType = Data.CommandType.StoredProcedure

        sqlCmd.Parameters.Add(New SqlParameter("@UserName", strUserName))
        sqlCmd.Parameters.Add(New SqlParameter("@ISBN", strISBN))
        sqlCmd.Parameters.Add(New SqlParameter("@CheckOutDate", CheckOutDate))
        sqlCmd.Parameters.Add(New SqlParameter("@ReturnDate", ReturnDate))
        sqlConn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()

        Response.Redirect("viewrentals.aspx")
    End Sub

    Protected Sub btn_Cancel_Click(sender As Object, e As EventArgs) Handles btn_Cancel.Click
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        tb_UserName.Focus()
    End Sub
End Class
