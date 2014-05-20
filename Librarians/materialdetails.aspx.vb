
Partial Class Librarians_materialdetails
    Inherits System.Web.UI.Page

    Protected Sub FormView1_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted

        Dim deletedMaterial As String = e.Values("Title").ToString()

        lbl_DeletedMaterial.Text = "The record " & deletedMaterial & " has been deleted from the database."

        Response.AddHeader("REFRESH", "3;URL=viewmaterials.aspx")

    End Sub

    Protected Sub FormView1_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Response.Redirect("viewmaterials.aspx")
    End Sub
End Class
