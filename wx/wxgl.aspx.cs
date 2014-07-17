using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


namespace wx
{
    public partial class wxgl : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
               bind_gzjh();
                bind_scjh();
                bind_zlzk();
            } 
        }

        private void bind_gzjh()  //工作计划
        {
            SqlConnection conn = db.conn();
            string dl1sql = "select * from liul_yxgl_xmgl_gzjh";
            SqlDataAdapter sda = new SqlDataAdapter(dl1sql, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "gzjh");
            DataTable dt = ds.Tables["gzjh"];
            GridView1.DataKeyNames = new string[] { "序号" };
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void bind_scjh()  //生产计划
        {
            SqlConnection conn = db.conn();
            string dl1sql = "select * from liul_yxgl_xmgl_wxkz";
            SqlDataAdapter sda = new SqlDataAdapter(dl1sql, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "scjh");
            DataTable dt = ds.Tables["scjh"];
            GridView2.DataKeyNames = new string[] { "序号" };
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        private void bind_zlzk()  //生产计划
        {
            SqlConnection conn = db.conn();
            string dl1sql = "select * from liul_yxgl_xmgl_wxkz";
            SqlDataAdapter sda = new SqlDataAdapter(dl1sql, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "scjh");
            DataTable dt = ds.Tables["scjh"];
            GridView3.DataKeyNames = new string[] { "序号" };
            GridView3.DataSource = dt;
            GridView3.DataBind();
        }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            bind_gzjh();
        }


        protected override void Render(HtmlTextWriter writer)  //单击进入编辑状态设置
        {
            foreach (GridViewRow gvr in this.GridView1.Rows) 
            {
                if (gvr.RowType != DataControlRowType.DataRow) return;

                if (gvr.RowState.HasFlag(DataControlRowState.Edit) == false)
                {
                    gvr.Attributes.Add("style", "background-color:none;");
                    gvr.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.GridView1, "Edit$" + gvr.RowIndex, true);
                }
                else
                {
                    gvr.Attributes.Add("style", "background_color:#FFD39B;");
                }
            }
            foreach (GridViewRow gvr in this.GridView2.Rows)
            {
                if (gvr.RowType != DataControlRowType.DataRow) return;

                if (gvr.RowState.HasFlag(DataControlRowState.Edit) == false)
                {
                    gvr.Attributes.Add("style", "background-color:none;");
                    gvr.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.GridView2, "Edit$" + gvr.RowIndex, true);
                }
                else
                {
                    gvr.Attributes.Add("style", "background_color:#FFD39B;");
                }
            }
           
            foreach (GridViewRow gvr in this.GridView3.Rows)
            {
                if (gvr.RowType != DataControlRowType.DataRow) return;

                if (gvr.RowState.HasFlag(DataControlRowState.Edit) == false)
                {
                    gvr.Attributes.Add("style", "background-color:none;");
                    gvr.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.GridView3, "Edit$" + gvr.RowIndex, true);
                }
                else
                {
                    gvr.Attributes.Add("style", "background_color:#FFD39B;");
                }
            }
            base.Render(writer);
        } 

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            bind_gzjh();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = db.conn();
            string strsql = "update liul_yxgl_xmgl_gzjh set"
                    + " 完成汇报='" + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim()
                   +  "', 完成汇报时间='" + DateTime.Now.ToString("yyyy-MM-dd")
                   + "',完成情况='" + ((DropDownList)(GridView1.Rows[e.RowIndex].Cells[5].Controls[1])).Text.ToString().Trim()
                    + "' where 序号='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
            SqlCommand comm = new SqlCommand(strsql, conn);
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            GridView1.EditIndex = -1;
            bind_gzjh(); 
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //翻页事件
            this.GridView1.PageIndex = e.NewPageIndex;
            bind_gzjh();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState == (DataControlRowState)4 || e.Row.RowState == (DataControlRowState)5))
                {
                    ((TextBox)e.Row.Cells[4].Controls[0]).Width = Unit.Pixel(300);
                    ((DropDownList)e.Row.Cells[5].Controls[1]).Width = Unit.Pixel(80);
                }
            }
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            bind_scjh();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            bind_scjh();
        }

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState == (DataControlRowState)4 || e.Row.RowState == (DataControlRowState)5))
                {
                    ((TextBox)e.Row.Cells[3].Controls[1]).Width = Unit.Pixel(80);
                    ((TextBox)e.Row.Cells[4].Controls[1]).Width = Unit.Pixel(80);
                    ((TextBox)e.Row.Cells[5].Controls[1]).Width = Unit.Pixel(80);
                    ((TextBox)e.Row.Cells[6].Controls[1]).Width = Unit.Pixel(80);
                    ((TextBox)e.Row.Cells[7].Controls[1]).Width = Unit.Pixel(80);
                    ((TextBox)e.Row.Cells[8].Controls[1]).Width = Unit.Pixel(80);
                }
            }
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = db.conn();
            string strsql = "update liul_yxgl_xmgl_wxkz set"
                   + " 实际转件日期='" + ((TextBox)(GridView2.Rows[e.RowIndex].Cells[3].Controls[1])).Text.ToString().Trim()
                   + "',实际粗加工日期='" + ((TextBox)(GridView2.Rows[e.RowIndex].Cells[4].Controls[1])).Text.ToString().Trim()
                   + "',实际精加工日期='" + ((TextBox)(GridView2.Rows[e.RowIndex].Cells[5].Controls[1])).Text.ToString().Trim()
                   + "',实际钳工日期='" + ((TextBox)(GridView2.Rows[e.RowIndex].Cells[6].Controls[1])).Text.ToString().Trim()
                   + "',实际清洗包装日期='" + ((TextBox)(GridView2.Rows[e.RowIndex].Cells[7].Controls[1])).Text.ToString().Trim()
                   + "',实际发运日期='" + ((TextBox)(GridView2.Rows[e.RowIndex].Cells[8].Controls[1])).Text.ToString().Trim()
                   + "' where 序号='" + GridView2.DataKeys[e.RowIndex].Value.ToString() + "'";
            SqlCommand comm = new SqlCommand(strsql, conn);
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            GridView2.EditIndex = -1;
            bind_scjh(); 
        }

        protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView3.EditIndex = e.NewEditIndex;
            bind_zlzk();
        }

        protected void GridView3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView3.EditIndex = -1;
            bind_zlzk();
        }

        protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = db.conn();
            string strsql = "update liul_yxgl_xmgl_wxkz set"
                   + " 转件节点质量状况='" + ((DropDownList)(GridView3.Rows[e.RowIndex].Cells[3].Controls[1])).Text.ToString().Trim()
                   + "',粗加节点质量状况='" + ((DropDownList)(GridView3.Rows[e.RowIndex].Cells[4].Controls[1])).Text.ToString().Trim()
                   + "',精加节点质量状况='" + ((DropDownList)(GridView3.Rows[e.RowIndex].Cells[5].Controls[1])).Text.ToString().Trim()
                   + "',钳工节点质量状况='" + ((DropDownList)(GridView3.Rows[e.RowIndex].Cells[6].Controls[1])).Text.ToString().Trim()
                   + "',包装节点质量状况='" + ((DropDownList)(GridView3.Rows[e.RowIndex].Cells[7].Controls[1])).Text.ToString().Trim()
                   + "',发运节点质量状况='" + ((DropDownList)(GridView3.Rows[e.RowIndex].Cells[8].Controls[1])).Text.ToString().Trim()
                   + "',备注='" + ((TextBox)(GridView3.Rows[e.RowIndex].Cells[9].Controls[0])).Text.ToString().Trim()
                   + "',评审意见='" + ((DropDownList)(GridView3.Rows[e.RowIndex].Cells[10].Controls[1])).Text.ToString().Trim()
                   + "',责任单位='" + ((DropDownList)(GridView3.Rows[e.RowIndex].Cells[11].Controls[1])).Text.ToString().Trim()
                   + "' where 序号='" + GridView3.DataKeys[e.RowIndex].Value.ToString() + "'";
            SqlCommand comm = new SqlCommand(strsql, conn);
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            GridView3.EditIndex = -1;
          //  bind_zlzk(); 
        }











    }
}