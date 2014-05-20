Imports System.Web.Security
Imports System.Web.Security.Roles
Imports System.Web.Security.Membership
Imports System.Data

Partial Class Librarians_patrondetails
    Inherits System.Web.UI.Page

    Protected Sub DeleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim selUser As Label = CType(FormView1.FindControl("lbl_UserName"), Label)

        If selUser IsNot Nothing Then
            Dim delUser As String = selUser.Text

            Membership.DeleteUser(selUser.Text)
        End If
    End Sub

    Protected Sub FormView1_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        Dim delPatronFname As String = e.Values("FirstName").ToString()
        Dim delPatronLname As String = e.Values("LastName").ToString()

        lbl_DeletedPatron.Text = "The patron " & delPatronFname & " " & delPatronLname & " has been deleted from the database."

        Response.AddHeader("REFRESH", "3;URL=viewpatron.aspx")

    End Sub

    Protected Sub FormView1_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Response.Redirect("viewpatron.aspx")
    End Sub
End Class
